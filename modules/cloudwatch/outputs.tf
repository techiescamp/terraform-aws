output "disk_utilization_alarm_arns" {
  description = "The ARNs of the disk utilization CloudWatch alarms"
  value       = { for id, alarm in aws_cloudwatch_metric_alarm.disk_utilization_alarm : id => alarm.arn }
}

output "memory_utilization_alarm_arns" {
  description = "The ARNs of the memory utilization CloudWatch alarms"
  value       = { for id, alarm in aws_cloudwatch_metric_alarm.memory_utilization_alarm : id => alarm.arn }
}

output "cpu_utilization_alarm_arns" {
  description = "The ARNs of the CPU utilization CloudWatch alarms"
  value       = { for id, alarm in aws_cloudwatch_metric_alarm.cpu_utilization_alarm : id => alarm.arn }
}

output "status_check_fail_alarm_arns" {
  description = "The ARNs of the status check fail CloudWatch alarms"
  value       = { for id, alarm in aws_cloudwatch_metric_alarm.status_check_fail_alarm : id => alarm.arn }
}


