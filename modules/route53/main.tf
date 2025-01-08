# Data source to check for existing hosted zone
data "aws_route53_zone" "existing" {
  count = var.create_zone ? 0 : 1
  name  = var.domain_name
}

# Create the primary hosted zone only if it doesn't exist
resource "aws_route53_zone" "primary" {
  count = var.create_zone ? 1 : 0
  name  = var.domain_name
  tags = {
    Environment = var.environment
    Project     = "CV Challenge"
  }
}

# Get the zone_id whether it's new or existing
locals {
  zone_id = var.create_zone ? aws_route53_zone.primary[0].zone_id : data.aws_route53_zone.existing[0].zone_id
}

# Create A record for the root domain pointing to CloudFront
resource "aws_route53_record" "root_domain" {
  zone_id = local.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}

# Create A record for www subdomain pointing to CloudFront
resource "aws_route53_record" "www" {
  zone_id = local.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}

# Create A record for mycv subdomain pointing to CloudFront
resource "aws_route53_record" "mycv" {
  zone_id = local.zone_id
  name    = "mycv.${var.domain_name}"
  type    = "A"
  alias {
    name                   = var.cloudfront_domain_name
    zone_id               = var.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}

