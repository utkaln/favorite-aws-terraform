# Create dynamo db from local module
module "ddb_wo" {
  source = "./modules/ddb"

  ddb_wo_name = var.ddb_wo_name

}

# Create S3 from terraform registry
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.s3_params.bucket_name
  acl    = var.s3_params.acl_private

  versioning = {
    enabled = false
  }

}

