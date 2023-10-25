variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the iam-policy"
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

variable "iam_policy_json_file" {
  type        = string
  description = "Name of the json file"
}