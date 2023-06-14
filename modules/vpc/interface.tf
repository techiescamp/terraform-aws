# Common Variables

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

variable "name" {
  default     = "Default"
  type        = string
  description = "Name of the VPC"
}

variable "project" {
  type        = string
  description = "Name of project this VPC is meant to house"
}

variable "environment" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "Region of the VPC"
}

# VPC Variables

variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

# Subnet Varaibles

variable "public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "app_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list(any)
  description = "List of application subnet CIDR blocks"
}

variable "db_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list(any)
  description = "List of Database subnet CIDR blocks"
}

variable "management_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list(any)
  description = "List of management subnet CIDR blocks"
}

variable "availability_zones" {
  default     = ["us-west-1a", "us-west-1b"]
  type        = list(any)
  description = "List of availability zones"
}
