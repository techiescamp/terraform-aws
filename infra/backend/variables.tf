variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the alb-asg resources"
}

variable "region" {
  type        = string
  description = "Region of the alb-asg"
}

variable "billing_mode" {
  type        = string
  description = "Billing mode for dynamodb"
}

variable "hash_key" {
  type        = string
  description = "Hash key name of dynamodb"
}

variable "attribute_name" {
  type        = string
  description = "Attribute name of dynamodb"
}

variable "attribute_type" {
  type        = string
  description = "Attribute type of dynamodb"
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
  description = "Name of cost-center for the resources."
}

variable "application" {
  type        = string
  description = "Name of the application"
}

