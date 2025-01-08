output "zone_id" {
  description = "The hosted zone ID of the Route53 zone"
  value       = aws_route53_zone.primary.zone_id
}

output "name_servers" {
  description = "The name servers for the hosted zone"
  value       = aws_route53_zone.primary.name_servers
}

output "domain_name" {
  description = "The domain name of the Route53 zone"
  value       = var.domain_name
}
