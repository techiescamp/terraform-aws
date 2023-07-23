variable "region" {
  type        = string
  description = "Region of the EC2 instance"
}

variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance"
}

variable "ami_id" {
  type        = string
  description = "AMI ID of the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type of the EC2 instance"
}

variable "key_name" {
  type        = string
  description = "Key name of the EC2 instance"
}

variable "instance_count" {
  type        = number
  description = "Count of the EC2 instances"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs of the EC2 instance"
}

variable "sg_name" {
  type        = string
  description = "Security group name for the instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the security group"
}

variable "ingress_cidr_block" {
  type        = list(string)
  description = "CIDR blocks for EC2 security group ingress rules"
}

variable "ingress_from_port" {
  description = "The starting port for ingress rules"
  type        = list(number)
}

variable "ingress_to_port" {
  description = "The ending port for ingress rules"
  type        = list(number)
}

variable "ingress_protocol" {
  description = "The protocol for ingress rules"
  type        = list(any)
}

variable "egress_cidr_block" {
  type        = list(string)
  description = "CIDR blocks for EC2 security group egress rules"
}

variable "egress_from_port" {
  description = "The starting port for egress rules"
  type        = list(number)
}

variable "egress_to_port" {
  description = "The ending port for egress rules"
  type        = list(number)
}

variable "egress_protocol" {
  description = "The protocol for egress rules"
  type        = list(any)
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the security group resources"
}

variable "name" {
  type        = string
  description = "The name of the resources"
}

variable "environment" {
  type        = list(string)
  description = "The environment name for the resources"
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource"
}

variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource"
}

variable "application" {
  type        = string
  description = "Name of the application related to the resource"
}
