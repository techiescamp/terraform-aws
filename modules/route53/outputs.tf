output "zone_id" {
  description = "The Zone ID of the Hosted Zone"
  value       = aws_route53_zone.dns_zone.zone_id
}

output "name_servers" {
  description = "The list of Name Servers of the Hosted Zone"
  value       = aws_route53_zone.dns_zone.name_servers
}

output "tags_all" {
  description = "The list of Tags associated with the Hosted Zone"
  value       = aws_route53_zone.dns_zone.tags_all
}