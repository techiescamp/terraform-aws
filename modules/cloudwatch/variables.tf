variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
  default     = ""
}

variable "sns_topic_name" {
  description = "The name of the SNS topic for CloudWatch alarms"
  type        = string
  default     = "Default_CloudWatch_Alarms_Topic"
}

variable "instance_ids" {
  description = "The ID of the EC2 instance to monitor"
  type        = list(string)
  default     = ["i-0644688300e6b8ce9", "i-0f6c49779bef0ec93"]
}

variable "alarm_threshold" {
  description = "The threshold for CloudWatch alarms"
  type        = number
  default     = 70
}

variable "evaluation_periods" {
  description = "The number of periods to evaluate"
  type        = number
  default     = 1
}

variable "alarm_period" {
  description = "The evaluation period for CloudWatch alarms"
  type        = number
  default     = 300
}

variable "alarm_actions" {
  description = "Actions to take when alarm state is triggered"
  type        = list(string)
  default     = []
}