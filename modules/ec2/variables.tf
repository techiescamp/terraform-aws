variable "region" {
  type        = string
  description = "Region of the ec2 instance"
}

variable "ami_id" {
  type        = string
  description = "AMI Id of the ec2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type of the ec2 instance"
}

variable "key_name" {
  type        = string
  description = "Key name of the ec2 instance"
}

variable "instance_count" {
  type        = number
  description = "Count of the ec2 instances"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids of the ec2 instance"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the ec2-sg resources"
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

variable "security_group_ids" {
  description = "List of security group IDs to attach to the EC2 instance."
  type        = list(string)
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Enable or disable public ip address"
}

variable "attach_instance_profile" {
  default     = false
  type        = bool
  description = "Attach instance profile or not"
}

variable "attach_eip" {
  type        = bool
  description = "Attach eip or not"
}

variable "storage_size" {
  type        = number
  description = "Storage size of the instance"
}

variable "iam_role" {
  default     = null
  description = "IAM role for the instance"
  type        = string
}