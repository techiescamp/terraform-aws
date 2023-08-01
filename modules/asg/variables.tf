variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the alb-asg resources"
}

variable "iam_role" {
  description = "IAM role for the instance"
  type        = string
}

variable "ami_id" {
  type        = string
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instances."
}

variable "instance_type" {
  type        = string
  description = "The type of EC2 instance to use for the ASG."
}

variable "key_name" {
  type        = string
  description = "The name of the EC2 key pair to use for the instances."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to use for the resources."
}

variable "asg_subnets" {
  description = "A list of subnet IDs to use for the resources."
  type        = list(string)
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group id of the ec2 instance"
}

variable "public_access" {
  description = "Whether the instance is public or not"
  type        = bool
}

variable "user_data" {
  description = "user data script"
  type        = string
}

variable "max_size" {
  description = "Maximum size of something"
  type        = number
}

variable "min_size" {
  description = "Minimum size of something"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity of something"
  type        = number
}

variable "propagate_at_launch" {
  description = "To enable ot disable propagate_at_launch"
  type        = bool
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

variable "alb_target_group_arn" {
  description = "load balancer target group arn"
  type        = string
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