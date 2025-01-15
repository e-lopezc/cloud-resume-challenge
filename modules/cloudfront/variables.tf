variable "domain_name" {
  description = "The website domain name"
  type        = string
}

variable "s3_bucket_website_regional_domain_name" {
  description = "The website endpoint of the S3 bucket"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acm_certificate_arn" {
  description = "The acm certificate arn for the domain name"
  type        = string
}