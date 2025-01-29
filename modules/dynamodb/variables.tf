variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing method for the dynamodb table"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "attribute_definitions" {
  description = "A list of attribute definitions for the DynamoDB table"
  type = list(object({
    attribute_name = string
    attribute_type = string
  }))
}

variable "hash_key" {
  description = "The name of the hash key attribute"
  type        = string
}

variable "range_key" {
  description = "The name of the range key attribute (optional)"
  type        = number
  default     = null
}

variable "tags"{
  description = "Tags of the project"
  type = string
  default = null
}