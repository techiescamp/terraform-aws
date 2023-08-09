variable "region" {
  type        = string
  description = "The AWS region for provider configuration."
}

variable "policy_name" {
  type        = string
  description = "A descriptive name for the AWS Organizations Tag Policy."
}

variable "policy_type" {
  type        = string
  description = "The type of the AWS Organizations Tag Policy."
}

variable "target_id" {
  type        = number
  description = "The ID of the target organizational unit to attach the Tag Policy."
}

variable "name_tag_key" {
  type        = string
  description = "The tag key for the 'Name' tag."
}

variable "environment_tag_key" {
  type        = string
  description = "The tag key for the 'Environment' tag."
}

variable "owner_tag_key" {
  type        = string
  description = "The tag key for the 'Owner' tag."
}

variable "owner_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Owner' tag."
}

variable "costcenter_tag_key" {
  type        = string
  description = "The tag key for the 'CostCenter' tag."
}

variable "costcenter_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'CostCenter' tag."
}

variable "application_tag_key" {
  type        = string
  description = "The tag key for the 'Application' tag."
}

variable "enforce_for_values" {
  type        = list(string)
  description = "A list of tag values to enforce for the 'Application' tag."
}
