locals {
  has_range_key = var.range_key != null && var.range_key != ""
}

resource "aws_dynamodb_table" "mycv_website_visitors" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity_units : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity_units : null
  hash_key       = var.hash_key
  range_key      = local.has_range_key != null ? var.range_key : null

  dynamic "attribute" {
    for_each = var.attribute_definitions
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = {
    Name        = var.table_name
    Environment = var.environment
  }

  /*point_in_time_recovery {
    enabled = true  # This will enable point-in-time recovery for data protection
  }

  server_side_encryption {
    enabled = true  # For data security, we could enable encryption at rest
  }
  */
}
