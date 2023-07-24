variable "region" {
  type        = string
  description = "Region for the provider."
}

variable "policy_name" {
  type        = string
  description = "Name for the tag policy."
}

variable "policy_type" {
  type        = string
  description = "Type of the policy."
}

variable "target_id" {
  type        = number
  description = "ID of the target."
}