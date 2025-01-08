variable "domain_name" {
  description = "The domain name for the website (e.g., example.com)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "The hosted zone ID of the CloudFront distribution"
  type        = string
}
