variable "lambda_name" {
  description = "The name of the lambda function"
  type        = string
}

variable "environment" {
  description = "The name of the environment"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the dynamo table that will be updated by the lambda"
  type        = string
}
