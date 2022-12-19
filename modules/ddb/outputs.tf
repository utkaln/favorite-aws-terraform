output "ddb_id" {
  description = "Name (id) of the ddb table"
  value       = aws_dynamodb_table.wo_table.id
}
