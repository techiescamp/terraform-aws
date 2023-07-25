variable "region" {
  type        = string
  description = "Region of the security group."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC associated with the security group."
}

variable "ingress_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for ingress rules of the EC2 security group."
}

variable "ingress_from_port" {
  description = "List of starting ports for ingress rules of the EC2 security group."
  type        = list(number)
}

variable "ingress_to_port" {
  description = "List of ending ports for ingress rules of the EC2 security group."
  type        = list(number)
}

variable "ingress_protocol" {
  description = "List of protocols for ingress rules of the EC2 security group."
  type        = list
}

variable "egress_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for egress rules of the EC2 security group."
}

variable "egress_from_port" {
  description = "List of starting ports for egress rules of the EC2 security group."
  type        = list(number)
}

variable "egress_to_port" {
  description = "List of ending ports for egress rules of the EC2 security group."
  type        = list(number)
}

variable "egress_protocol" {
  description = "List of protocols for egress rules of the EC2 security group."
  type        = list
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the EC2 security group resources."
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource."
}

variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource."
}

variable "application" {
  type        = string
  description = "Name of the application related to the resource."
}
