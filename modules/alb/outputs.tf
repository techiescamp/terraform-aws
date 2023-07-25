output "load_balancer_dns_name" {
  description = "LoadBalancer dns name"
  value = aws_lb.application_load_balancer.dns_name
}

output "lb_target_group_arn" {
  description = "LB Target Grouparn"
  value = aws_lb_target_group.alb_tg.arn
}
