variable "ddb_wo_name" {
  description = "Name of WO table"
  type        = string
  default     = "wo_table"
}

variable "s3_params" {
  description = "values of s3 params required to create bucket"
  type = object({
    bucket_name = string
    acl_private = optional(string)
  })
  default = {
    acl_private = "private"
    bucket_name = "test-s3-pvt"
  }
}
