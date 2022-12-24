variable "ddb_wo_name" {
  description = "Name of WO table"
  type        = string
  default     = "wo_table"
}

variable "s3_params" {
  description = "values of s3 params required to create bucket"
  type = object({
    bucket_name        = string
    acl_private        = optional(string)
    versioning_enabled = bool
  })
  default = {
    acl_private        = "private"
    bucket_name        = "test-s3-pvt"
    versioning_enabled = false
  }
}

variable "lambda_params" {
  description = "values required to create lambda function"
  type = object({
    function_name = string
    description   = string
    handler       = string
    runtime       = string
    publish       = bool
    source_path   = string
    store_on_s3   = bool
    s3_bucket     = string
  })

  default = {
    function_name      = "test-lambda-s3"
    description        = "Test function from S3"
    handler            = "index.handler"
    runtime            = "node18.0"
    publish            = false
    source_path        = "../src/lambda-function1"
    store_on_s3        = false
    s3_bucket          = "test-lambda-builds"
    versioning_enabled = false
  }
}
