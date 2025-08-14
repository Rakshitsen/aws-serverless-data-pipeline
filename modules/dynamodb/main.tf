resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = 20
  write_capacity = 20
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }
  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}