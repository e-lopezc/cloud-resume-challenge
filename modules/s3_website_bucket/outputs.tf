output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.website_bucket.id
}

output "website_endpoint" {
  description = "website endpoint"
  value       = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.website_bucket.arn
}

output "website_bucket_domain_name" {
  description = "Bucket domain name"
  value       = aws_s3_bucket.website_bucket.bucket_domain_name
}

output "website_bucket_regional_domain_name" {
  description = "Bucket regional domain name"
  value       = aws_s3_bucket.website_bucket.bucket_regional_domain_name
}
