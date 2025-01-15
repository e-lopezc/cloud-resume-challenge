# output only assuming that there is an existing zone
output "route53_zone_id" {
  description = "The hosted zone ID of the Route53 zone"
  value       = aws_route53_record.mycv.zone_id
}

output "route53_domain_cv_name" {
  description = "The domain name of the Route53 zone"
  value       = aws_route53_record.mycv.name
}

