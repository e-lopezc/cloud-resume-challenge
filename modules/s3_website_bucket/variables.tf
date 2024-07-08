variable "bucket_name" {
  description = "name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "environment (dev, staging, prod)"
  type        = string
}