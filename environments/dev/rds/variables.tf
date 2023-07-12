variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the RDS resources"
}

variable "update_rds_endpoint" {
  type    = bool
  default = true
}

variable "region" {
  type        = string
  description = "Region of the rds"
}

variable "environment" {
  description = "The environment name for the resources."
}

variable "owner" {
  type        = string
  description = "Name of the owner for this RDS"
}

variable "cost_center" {
  type        = string
  description = "Name of cost-center for this RDS"
}

variable "db_username" {
  description = "The username for the RDS database"
  type    = string
}

variable "db_name" {
  description = "The identifier for the RDS instance"
  type    = string
}

variable "db_instance_class" {
  description = "The RDS instance class"
  type    = string
}

variable "parameter_name" {
  description = "The RDS instance class"
  type    = string
}