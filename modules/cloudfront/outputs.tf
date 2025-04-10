output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.cv_distribution.id
  description = "The ID of the CloudFront distribution"
}

output "cloudfront_distribution_domain_name" {
  value       = aws_cloudfront_distribution.cv_distribution.domain_name
  description = "The domain name of the CloudFront distribution"
}

output "oai_arn" {
  description = "ARN of the CloudFront Origin Access Identity"
  value       = aws_cloudfront_origin_access_identity.oai.iam_arn
}
