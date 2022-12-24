# Create dynamo db from local module
module "ddb_wo" {
  source = "./modules/ddb"

  ddb_wo_name = var.ddb_wo_name

}

# Create S3 from terraform registry module
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.s3_params.bucket_name
  acl    = var.s3_params.acl_private

  versioning = {
    enabled = var.s3_params.versioning_enabled
  }

}

# Create eventbridge from terraform registry module
module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"

  create_bus = false

  rules = {
    crons = {
      description         = "Trigger for a Lambda"
      schedule_expression = "rate(5 minutes)"
    }
  }

  targets = {
    crons = [
      {
        name  = "lambda-simple-cron"
        arn   = data.aws_lambda_function.lambda_exists.arn
        input = jsonencode({ "job" : "cron-by-rate" })
      }
    ]
  }
}




