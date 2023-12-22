resource "aws_dynamodb_table" "cloudwatch_logs" {
  name           = "cloudwatch-logs-table"
  billing_mode   = "PAY_PER_REQUEST" 
  hash_key       = "log_id"
  attribute {
    name = "log_id"
    type = "S"
  }
}