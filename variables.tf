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

variable "github_repo" {
  description = "The GitHub repository containing the website files (format: owner/repo)"
  type        = string
}

variable "github_branch" {
  description = "The branch of the GitHub repository to use"
  type        = string
  default     = "main"
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
}