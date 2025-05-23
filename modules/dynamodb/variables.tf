variable "environment" {
  description = "environment (dev, staging, prod)"
  type        = string
}

variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Controls how we are charged for read and write throughput. Values are PROVISIONED or PAY_PER_REQUEST"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity_units" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field is required"
  type        = number
  default     = null
}

variable "write_capacity_units" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field is required"
  type        = number
  default     = null
}

variable "attribute_definitions" {
  description = "List of attribute definitions"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    {
      name = "VisitorId"
      type = "S"
    }
  ]
}

variable "hash_key" {
  description = "The name of the hash key attribute"
  type        = string
  default     = "VisitorId"
}

variable "range_key" {
  description = "The name of the range key attribute (optional)"
  type        = string
  default     = null
}

