provider "aws" {
  region = var.aws_region
}

data "aws_sns_topic" "cloudwatch_sns_topic" {
  name = var.sns_topic_name
}

data "aws_autoscaling_group" "example" {
  count = length(var.autoscaling_group_name) > 0 ? 1 : 0
  name  = var.autoscaling_group_name
}

data "aws_instances" "asg_instances" {
  count = length(var.autoscaling_group_name) > 0 ? 1 : 0
  instance_tags = {
    "aws:autoscaling:groupName" = data.aws_autoscaling_group.example[0].name
  }
}

locals {
  combined_instance_ids = distinct(concat(
    length(var.autoscaling_group_name) > 0 ? data.aws_instances.asg_instances[0].ids : [],
    var.instance_ids
  ))
}

output "instance_ids" {
  value = local.combined_instance_ids
}

data "aws_instance" "instances" {
  for_each    = toset(local.combined_instance_ids)
  instance_id = each.value
}

locals {
  instance_alarms = {
    for id in local.combined_instance_ids : id => {
      disk_utilization    = "demo-disk-utilization-alarm-${id}"
      memory_utilization  = "demo-memory-utilization-alarm-${id}"
      cpu_utilization     = "demo-cpu-utilization-alarm-${id}"
      status_check_fail   = "demo-status-check-fail-alarm-${id}"
      cpu_credit_usage    = "demo-cpu-credit-usage-alarm-${id}"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "disk_utilization_alarm" {
  for_each = local.instance_alarms

  alarm_name                = each.value.disk_utilization
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "disk_used_percent"
  namespace                 = "CWAgent"
  period                    = var.alarm_period
  statistic                 = "Average"
  threshold                 = var.alarm_threshold
  treat_missing_data        = "missing"
  insufficient_data_actions = var.alarm_actions

  dimensions = {
    InstanceId = each.key
    device     = "xvda1"
    fstype     = "xfs"
    path       = "/"
  }

  alarm_description = "This metric monitors EC2 disk utilization for instance ${each.key}"
  actions_enabled   = true
  alarm_actions     = [data.aws_sns_topic.cloudwatch_sns_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_alarm" {
  for_each = local.instance_alarms

  alarm_name                = each.value.memory_utilization
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "mem_used_percent"
  namespace                 = "CWAgent"
  period                    = var.alarm_period
  statistic                 = "Average"
  threshold                 = var.alarm_threshold
  treat_missing_data        = "missing"
  insufficient_data_actions = var.alarm_actions

  dimensions = {
    InstanceId = each.key
  }

  alarm_description = "This metric monitors EC2 memory utilization for instance ${each.key}"
  actions_enabled   = true
  alarm_actions     = [data.aws_sns_topic.cloudwatch_sns_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  for_each = local.instance_alarms

  alarm_name                = each.value.cpu_utilization
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.alarm_period
  statistic                 = "Average"
  threshold                 = var.alarm_threshold
  treat_missing_data        = "missing"
  insufficient_data_actions = var.alarm_actions

  dimensions = {
    InstanceId = each.key
  }

  alarm_description = "This metric monitors EC2 CPU utilization for instance ${each.key}"
  actions_enabled   = true
  alarm_actions     = [data.aws_sns_topic.cloudwatch_sns_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "status_check_fail_alarm" {
  for_each = local.instance_alarms

  alarm_name                = each.value.status_check_fail
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "StatusCheckFailed"
  namespace                 = "AWS/EC2"
  period                    = var.alarm_period
  statistic                 = "Average"
  threshold                 = 1
  treat_missing_data        = "missing"
  insufficient_data_actions = var.alarm_actions

  dimensions = {
    InstanceId = each.key
  }

  alarm_description = "This metric monitors EC2 status check failures for instance ${each.key}"
  actions_enabled   = true
  alarm_actions     = [data.aws_sns_topic.cloudwatch_sns_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_credit_usage_alarm" {
  for_each = local.instance_alarms

  alarm_name                = each.value.cpu_credit_usage
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUCreditUsage"
  namespace                 = "AWS/EC2"
  period                    = var.alarm_period
  statistic                 = "Average"
  threshold                 = var.alarm_threshold
  treat_missing_data        = "missing"
  insufficient_data_actions = var.alarm_actions

  dimensions = {
    InstanceId = each.key
  }

  alarm_description = "This metric monitors EC2 CPU credit usage for instance ${each.key}"
  actions_enabled   = true
  alarm_actions     = [data.aws_sns_topic.cloudwatch_sns_topic.arn]
}
