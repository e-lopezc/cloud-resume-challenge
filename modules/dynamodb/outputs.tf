output "dynamodb_table_name" {
  value = aws_dynamodb_table.mycv_website_visitors.name
}

output "dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.mycv_website_visitors.id
}