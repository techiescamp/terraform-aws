variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the alb-asg resources"
}

variable "region" {
  type        = string
  description = "Region of the alb-asg"
}

variable "internal" {
  description = "Whether the load balancer is internal or not"
  type        = bool
}

variable "loadbalancer_type" {
  description = "Load balancer type"
  type        = string
}

variable "alb_subnets" {
  description = "A list of subnet IDs to use for the resources."
  type        = list(string)
}

variable "target_group_port" {
  description = "Target group port"
  type        = number
}

variable "target_group_protocol" {
  description = "Target group protocol"
  type        = string
}

variable "target_type" {
  description = "Target type"
  type        = string
}

variable "load_balancing_algorithm" {
  description = "Specify the load balancing algorithm type"
  type        = string
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
}

variable "health_check_port" {
  description = "Health check port"
  type        = number
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
}

variable "health_check_interval" {
  description = "Health check interval"
  type        = number
}

variable "health_check_timeout" {
  description = "Health check timeout"
  type        = number
}

variable "health_check_healthy_treshold" {
  description = "Health check healthy threshold"
  type        = number
}

variable "health_check_unhealthy_treshold" {
  description = "Health check unhealthy threshold"
  type        = number
}

variable "listener_port" {
  description = "Listener port"
  type        = number
}

variable "listener_protocol" {
  description = "Listener protocol"
  type        = string
}

variable "listener_type" {
  description = "Listener type"
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

variable "alb_ingress_cidr_block" {
  type        = list(string)
  description = "CIDR blocks for EC2 security group ingress rules"
}

variable "alb_ingress_from_port" {
  description = "The starting port for ingress rules"
  type        = list(number)
}

variable "alb_ingress_to_port" {
  description = "The ending port for ingress rules"
  type        = list(number)
}

variable "alb_ingress_protocol" {
  description = "The protocol for ingress rules"
  type        = list(any)
}

variable "alb_egress_cidr_block" {
  type        = list(string)
  description = "CIDR blocks for EC2 security group egress rules"
}

variable "alb_egress_from_port" {
  description = "The starting port for egress rules"
  type        = list(number)
}

variable "alb_egress_to_port" {
  description = "The ending port for egress rules"
  type        = list(number)
}

variable "alb_egress_protocol" {
  description = "The protocol for egress rules"
  type        = list(any)
}