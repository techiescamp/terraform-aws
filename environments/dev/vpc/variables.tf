# Common Variables

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

variable "region" {
  type        = string
  description = "Region of the VPC"
}

# VPC Variables

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

# Subnet Varaibles

variable "public_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "app_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of application subnet CIDR blocks"
}

variable "db_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of Database subnet CIDR blocks"
}

variable "management_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of management subnet CIDR blocks"
}

variable "platform_subnet_cidr_blocks" {
  type        = list(any)
  description = "List of platform subnet CIDR blocks"
}

variable "availability_zones" {
  type        = list(any)
  description = "List of availability zones"
}

variable "create_nat_gateway" {
  type        = bool
  description = "whether to create a NAT gateway or not"
}

variable "owner" {
  type        = string
  description = "Name of owner"
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
}

variable "cost_center" {
  type        = string
  description = "Name of cost-center for this alb-asg"
}

variable "application" {
  type        = string
  description = "Name of the application"
}

variable "instance_tenancy" {
  type        = string
  description = "Set instance-tenancy"
}

variable "enable_dns_support" {
  type        = bool
  description = "whether to enable DNS support or not"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "whether to enable DNS hostnames or not"
}

variable "domain" {
  type        = string
  description = "Set the domain of eip"
}

variable "destination_cidr_block" {
  type        = string
  description = "Set the destination cidr block"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "whether to map public ip on launch or not"
}

variable "create_s3_endpoint" {
  type        = bool
  description = "whether to create s3 endpoint or not"
}

variable "create_secrets_manager_endpoint" {
  type        = bool
  description = "whether to create secrets-manager endpoint or not"
}

variable "create_cloudwatch_logs_endpoint" {
  type        = bool
  description = "whether to create cloudwatch logs endpoint or not"
}

variable "ingress_public_nacl_rule_no" {
  type        = list(number)
  description = "List of public nacl ingress rule no"
}

variable "ingress_public_nacl_action" {
  type        = list(string)
  description = "List of public nacl ingress action "
}

variable "ingress_public_nacl_from_port" {
  type        = list(number)
  description = "List of public nacl ingress from port "
}

variable "ingress_public_nacl_to_port" {
  type        = list(number)
  description = "List of public nacl ingress to port "
}

variable "ingress_public_nacl_protocol" {
  type        = list(string)
  description = "List of public nacl ingress protocol "
}

variable "ingress_public_nacl_cidr_block" {
  type        = list(string)
  description = "List of public nacl ingress cidr block "
}

variable "egress_public_nacl_rule_no" {
  type        = list(number)
  description = "List of public nacl egress rule no"
}

variable "egress_public_nacl_action" {
  type        = list(string)
  description = "List of public nacl egress action "
}

variable "egress_public_nacl_from_port" {
  type        = list(number)
  description = "List of public nacl egress from port "
}

variable "egress_public_nacl_to_port" {
  type        = list(number)
  description = "List of public nacl egress to port "
}

variable "egress_public_nacl_protocol" {
  type        = list(string)
  description = "List of public nacl egress protocol "
}

variable "egress_public_nacl_cidr_block" {
  type        = list(string)
  description = "List of public nacl egress cidr block "
}

variable "ingress_app_nacl_rule_no" {
  type        = list(number)
  description = "List of app nacl ingress rule no"
}

variable "ingress_app_nacl_action" {
  type        = list(string)
  description = "List of app nacl ingress action "
}

variable "ingress_app_nacl_from_port" {
  type        = list(number)
  description = "List of app nacl ingress from port "
}

variable "ingress_app_nacl_to_port" {
  type        = list(number)
  description = "List of app nacl ingress to port "
}

variable "ingress_app_nacl_protocol" {
  type        = list(string)
  description = "List of app nacl ingress protocol "
}

variable "ingress_app_nacl_cidr_block" {
  type        = list(string)
  description = "List of app nacl ingress cidr block "
}

variable "egress_app_nacl_rule_no" {
  type        = list(number)
  description = "List of app nacl egress rule no"
}

variable "egress_app_nacl_action" {
  type        = list(string)
  description = "List of app nacl egress action "
}

variable "egress_app_nacl_from_port" {
  type        = list(number)
  description = "List of app nacl egress from port "
}

variable "egress_app_nacl_to_port" {
  type        = list(number)
  description = "List of app nacl egress to port "
}

variable "egress_app_nacl_protocol" {
  type        = list(string)
  description = "List of app nacl egress protocol "
}

variable "egress_app_nacl_cidr_block" {
  type        = list(string)
  description = "List of app nacl egress cidr block "
}

variable "ingress_db_nacl_rule_no" {
  type        = list(number)
  description = "List of db nacl ingress rule no"
}

variable "ingress_db_nacl_action" {
  type        = list(string)
  description = "List of db nacl ingress action "
}

variable "ingress_db_nacl_from_port" {
  type        = list(number)
  description = "List of db nacl ingress from port "
}

variable "ingress_db_nacl_to_port" {
  type        = list(number)
  description = "List of db nacl ingress to port "
}

variable "ingress_db_nacl_protocol" {
  type        = list(string)
  description = "List of db nacl ingress protocol "
}

variable "ingress_db_nacl_cidr_block" {
  type        = list(string)
  description = "List of db nacl ingress cidr block "
}

variable "egress_db_nacl_rule_no" {
  type        = list(number)
  description = "List of db nacl egress rule no"
}

variable "egress_db_nacl_action" {
  type        = list(string)
  description = "List of db nacl egress action "
}

variable "egress_db_nacl_from_port" {
  type        = list(number)
  description = "List of db nacl egress from port "
}

variable "egress_db_nacl_to_port" {
  type        = list(number)
  description = "List of db nacl egress to port "
}

variable "egress_db_nacl_protocol" {
  type        = list(string)
  description = "List of db nacl egress protocol "
}

variable "egress_db_nacl_cidr_block" {
  type        = list(string)
  description = "List of db nacl egress cidr block "
}

variable "ingress_management_nacl_rule_no" {
  type        = list(number)
  description = "List of management nacl ingress rule no"
}

variable "ingress_management_nacl_action" {
  type        = list(string)
  description = "List of management nacl ingress action "
}

variable "ingress_management_nacl_from_port" {
  type        = list(number)
  description = "List of management nacl ingress from port "
}

variable "ingress_management_nacl_to_port" {
  type        = list(number)
  description = "List of management nacl ingress to port "
}

variable "ingress_management_nacl_protocol" {
  type        = list(string)
  description = "List of management nacl ingress protocol "
}

variable "ingress_management_nacl_cidr_block" {
  type        = list(string)
  description = "List of management nacl ingress cidr block "
}

variable "egress_management_nacl_rule_no" {
  type        = list(number)
  description = "List of management nacl egress rule no"
}

variable "egress_management_nacl_action" {
  type        = list(string)
  description = "List of management nacl egress action "
}

variable "egress_management_nacl_from_port" {
  type        = list(number)
  description = "List of management nacl egress from port "
}

variable "egress_management_nacl_to_port" {
  type        = list(number)
  description = "List of management nacl egress to port "
}

variable "egress_management_nacl_protocol" {
  type        = list(string)
  description = "List of management nacl egress protocol "
}

variable "egress_management_nacl_cidr_block" {
  type        = list(string)
  description = "List of management nacl egress cidr block "
}

variable "ingress_platform_nacl_rule_no" {
  type        = list(number)
  description = "List of platform nacl ingress rule no"
}

variable "ingress_platform_nacl_action" {
  type        = list(string)
  description = "List of platform nacl ingress action "
}

variable "ingress_platform_nacl_from_port" {
  type        = list(number)
  description = "List of platform nacl ingress from port "
}

variable "ingress_platform_nacl_to_port" {
  type        = list(number)
  description = "List of platform nacl ingress to port "
}

variable "ingress_platform_nacl_protocol" {
  type        = list(string)
  description = "List of platform nacl ingress protocol "
}

variable "ingress_platform_nacl_cidr_block" {
  type        = list(string)
  description = "List of platform nacl ingress cidr block "
}

variable "egress_platform_nacl_rule_no" {
  type        = list(number)
  description = "List of platform nacl egress rule no"
}

variable "egress_platform_nacl_action" {
  type        = list(string)
  description = "List of platform nacl egress action "
}

variable "egress_platform_nacl_from_port" {
  type        = list(number)
  description = "List of platform nacl egress from port "
}

variable "egress_platform_nacl_to_port" {
  type        = list(number)
  description = "List of platform nacl egress to port "
}

variable "egress_platform_nacl_protocol" {
  type        = list(string)
  description = "List of platform nacl egress protocol "
}

variable "egress_platform_nacl_cidr_block" {
  type        = list(string)
  description = "List of platform nacl egress cidr block "
}
