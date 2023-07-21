output "load_balancer_dns_name" {
  description = "LoadBalancer dns name"
  value = module.lb-asg.load_balancer_dns_name
}

output "auto_scaling_group_name" {
  description = "Auto scaling group name"
  value = module.lb-asg.auto_scaling_group_name
}

output "launch_template_id" {
  description = " launch template id"
  value = module.lb-asg.launch_template_id
}
