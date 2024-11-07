
output "rds_address" {
  description = "The address of the RDS instance"
  value       = module.rds.rds_address
}

output "rds_endpoint" {
  description = "The address of the RDS instance"
  value       = module.rds.rds_endpoint
}

output "master_user_secret" {
  description = "The address of the RDS instance"
  value       = module.rds.master_user_secret
}

