locals {
  has_range_key = var.range_key != null && var.range_key != ""
}

resource "aws_dynamodb_table" "mycv_website_visitors" {
  name                  = var.table_name
  billing_mode          = var.billing_mode
  read_capacity_units   = var.billing_mode == "PROVISIONED" ? var.read_capacity_units : null
  write_capacity_units  = var.billing_mode == "PROVISIONED" ? var.write_capacity_units : null
  attribute_definitions = var.attribute_definitions
  hash_key              = var.hash_key
  range_key             = local.has_range_key != null ? var.range_key : null

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  point_in_time_recovery {
    enabled = true  # Enable point-in-time recovery for data protection
  }

  server_side_encryption {
    enabled = true  # Enable encryption at rest
  }

  ttl {
    enabled        = false  # Disable TTL for visitor counts as we want to keep the data
    attribute_name = ""
  }
  
  tags = var.tags

}
