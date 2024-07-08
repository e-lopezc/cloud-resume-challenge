output "website_url" {
  description = "The URL of the website"
  value       = module.s3_website_bucket.website_endpoint
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_website_bucket.website_bucket_name
}