variable "aws_region" {
  description = "The AWS region we will deploy to"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket that will contain the cv website"
  type        = string
}

variable "environment" {
  description = "The environment to deploy to (dev, staging, prod)"
  type        = string
}