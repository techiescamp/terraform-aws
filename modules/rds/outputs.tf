# output "rds_instance_endpoint" {
#   value = data.aws_db_instance.rds_instance.endpoint
#   description = "RDS endpoint"
# }

# output "rds_instance_endpoint" {
#   description = "The connection endpoint for the RDS instance"
#   value       = module.rds.aws_db_instance.rds_instance.endpoint
# }


# output "instance_address" {
#   value       = join("", aws_db_instance.rds_instance.*.address)
#   description = "Address of the instance"
# }

output "instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.rds_instance.address
}
