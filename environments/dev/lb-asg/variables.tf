variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the lb-asg resources"
}

variable "region" {
  type        = string
  description = "Region of the lb-asg"
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instances."
}

variable "instance_type" {
  description = "The type of EC2 instance to use for the ASG."
}

variable "key_name" {
  description = "The name of the EC2 key pair to use for the instances."
}

variable "environment" {
  description = "The environment name for the resources."
}

variable "vpc_id" {
  description = "The ID of the VPC to use for the resources."
}

variable "subnets" {
  description = "A list of subnet IDs to use for the resources."
  type        = list(string)
}

variable "iam_role_arn" {
  description = "ARN of the existing IAM role"
  type        = string
  default     = null
}

variable "owner" {
  type        = string
  description = "Name of owner this lb-asg is meant to house"
}

variable "cost_center" {
  type        = string
  description = "Name of cost-center for this lb-asg"
}
