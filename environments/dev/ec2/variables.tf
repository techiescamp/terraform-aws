variable "region" {
  type        = string
  description = "Region of the ec2 instance"
}

variable "instance_name" {
  type        = string
  description = "Name of the ec2 instance"
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

variable "security_group_ids" {
  type        = list(string)
  description = "Security group id of the ec2 instance"
}

variable "instance_count" {
  type        = number
  description = "Count of the ec2 instances"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids of the ec2 instance"
}