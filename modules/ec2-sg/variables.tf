variable "region" {
  type        = string
  description = "Region of the security group"
}

variable "sg_name" {
  type        = string
  description = "Security group for instance"
}

variable "cidr_block" {
  type        = list(string)
  description = "CIDR block for EC2 security group"
}

variable "from_port" {
  description = "The starting port for ingress rules"
  type        = list(number)
}

variable "to_port" {
  description = "The ending port for ingress rules"
  type        = list(number)
}

variable "protocol" {
  description = "The protocol for ingress rules"
  type        = list(string)
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the ec2-sg resources"
}

variable "name" {
  type        = string
  description = "The name of the resources."
}

variable "environment" {
  type        = list(string)
  description = "The environment name for the resources."
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource"
}

variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource."
}

variable "application" {
  type        = string
  description = "Name of the application related to the resource."
}