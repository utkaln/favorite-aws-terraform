resource "aws_dynamodb_table" "wo_table" {
  name         = var.ddb_wo_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "woid"
  range_key = "mcid"

  attribute {
    name = "woid"
    type = "S"
  }

  attribute {
    name = "mcid"
    type = "N"
  }
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
