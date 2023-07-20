variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the lb-asg resources"
}

variable "region" {
  type        = string
  description = "Region of the lb-asg"
}

variable "instance_profile" {
  description = "Instance profile for the instance which the instance role is associated with"
  type        = string
}

variable "instance_role" {
  description = "Instance role for the instance"
  type        = string
}

variable "lb_from_port" {
  description = "Load balancer from port"
  type        = number
}

variable "lb_to_port" {
  description = "Load balancer to port"
  type        = number
}

variable "lb_protocol" {
  description = "Load balancer protocol"
  type        = string
}

variable "lb_cidr_block" {
  description = "Load balancer CIDR block"
  type        = list(string)
}

variable "internal" {
  description = "Whether the load balancer is internal or not"
  type        = bool
}

variable "lb_type" {
  description = "Load balancer type"
  type        = string
}

variable "instance_from_port" {
  description = "Instance from port"
  type        = number
}

variable "instance_to_port" {
  description = "Instance to port"
  type        = number
}

variable "instance_protocol" {
  description = "Instance protocol"
  type        = string
}

variable "instance_cidr_block" {
  description = "Instance CIDR block"
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

variable "subnets" {
  description = "A list of subnet IDs to use for the resources."
  type        = list(string)
}

variable "public_access" {
  description = "Whether the instance is public or not"
  type        = bool
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
  description = "Name of cost-center for this lb-asg"
}

variable "application" {
  type        = string
  description = "Name of the application"
}
