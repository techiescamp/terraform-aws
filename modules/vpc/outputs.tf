output "id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "List of public subnet IDs"
}

output "app_subnet_ids" {
  value       = aws_subnet.app.*.id
  description = "List of private subnet IDs"
}

output "db_subnet_ids" {
  value       = aws_subnet.db.*.id
  description = "List of private subnet IDs"
}

output "management_subnet_ids" {
  value       = aws_subnet.management.*.id
  description = "List of private subnet IDs"
}

output "platform_subnet_ids" {
  value       = aws_subnet.platform.*.id
  description = "List of private subnet IDs"
}

output "cidr_block" {
  value       = var.vpc_cidr_block
  description = "The CIDR block associated with the VPC"
}
