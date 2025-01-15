output "website_url" {
  description = "The URL of the website"
  value       = module.s3_website_bucket.website_endpoint
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_website_bucket.website_bucket_name
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.cloud_distribution.cloudfront_distribution_domain_name
}

output "route53_zone_id" {
  description = "Zone ID of the Route53 hosted zone"
  value       = module.route53.route53_zone_id
}

output "route53_mycv_record" {
  description = "subdomain name for mycv record"
  value       = module.route53.route53_domain_cv_name
}