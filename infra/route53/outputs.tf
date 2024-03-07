output "zone_id" {
  description = "The Zone ID of the Hosted Zone"
  value       = module.route53.zone_id
}

output "name_servers" {
  description = "The list of Name Servers of the Hosted Zone"
  value       = module.route53.name_servers
}

output "tags_all" {
  description = "The list of Tags associated with the Hosted Zone"
  value       = module.route53.tags_all
}