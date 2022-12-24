# Zip the Lamda function on the fly
data "archive_file" "source" {
  type        = "zip"
  source_dir  = "../lambda/src"
  output_path = "../lambda/loadbalancer-to-es.zip"
}

# upload zip to s3 and then update lamda function from s3
resource "aws_s3_bucket_object" "file_upload" {
  bucket = aws_s3_bucket.bucket.id
  key    = "lambda-functions/loadbalancer-to-es.zip"
  source = data.archive_file.source.output_path # its mean it depended on zip
}


# Create lambda function with S3 location for Lambda
module "aws_lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = var.lambda_params.function_name
  description   = var.lambda_params.description
  handler       = var.lambda_params.handler
  runtime       = var.lambda_params.runtime
  publish       = var.lambda_params.publish
  source_path   = var.lambda_params.source_path
  store_on_s3   = var.lambda_params.store_on_s3
  s3_bucket     = var.lambda_params.s3_bucket

  environment_variables = {
    Serverless = "Terraform"
  }

  tags = {
    Module = "lambda-from-s3-source"
  }
}

data "aws_lambda_function" "lambda_exists" {
  function_name = var.lambda_params.function_name
}
