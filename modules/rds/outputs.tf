output "rds_instance_endpoint" {
  value = data.aws_db_instance.rds_instance.endpoint
  description = "RDS endpoint"
}
