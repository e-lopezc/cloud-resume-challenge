variable "bucket_name" {
  description = "name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "environment (dev, staging, prod)"
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

variable "cloudfront_oai_arn" {
  description = "ARN of CloudFront Origin Access Identity"
  type        = string
  default     = ""
}
