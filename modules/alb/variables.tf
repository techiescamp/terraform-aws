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

variable "security_group_ids" {
  type        = list(string)
  description = "Security group id of the ec2 instance"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to use for the resources."
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

variable "health_check_healthy_threshold" {
  description = "Health check healthy threshold"
  type        = number
}

variable "health_check_unhealthy_threshold" {
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
