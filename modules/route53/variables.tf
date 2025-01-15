variable "domain_name" {
  description = "The domain name for the cv website (e.g., eliaslopezc.com)"
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

variable "create_zone" {
  description = "Variable to control whether to create a new Route53 hosted zone (true) or use an existing one (false)"
  type        = bool
  default     = false
}
