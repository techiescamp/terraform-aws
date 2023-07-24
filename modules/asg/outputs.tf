output "auto_scaling_group_name" {
  description = "Auto scaling group name"
  value = aws_autoscaling_group.application_asg.name
}

output "launch_template_id" {
  description = " launch template id"
  value = aws_launch_template.application_lt.id
}
