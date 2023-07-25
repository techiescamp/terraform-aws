## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.application_load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.application_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Name of the application | `string` | n/a | yes |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | Name of cost-center for this alb-asg | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name for the resources. | `string` | n/a | yes |
| <a name="input_health_check_healthy_treshold"></a> [health\_check\_healthy\_treshold](#input\_health\_check\_healthy\_treshold) | Health check healthy threshold | `number` | n/a | yes |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Health check interval | `number` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Health check path | `string` | n/a | yes |
| <a name="input_health_check_port"></a> [health\_check\_port](#input\_health\_check\_port) | Health check port | `number` | n/a | yes |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Health check protocol | `string` | n/a | yes |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Health check timeout | `number` | n/a | yes |
| <a name="input_health_check_unhealthy_treshold"></a> [health\_check\_unhealthy\_treshold](#input\_health\_check\_unhealthy\_treshold) | Health check unhealthy threshold | `number` | n/a | yes |
| <a name="input_internal"></a> [internal](#input\_internal) | Whether the load balancer is internal or not | `bool` | n/a | yes |
| <a name="input_listener_port"></a> [listener\_port](#input\_listener\_port) | Listener port | `number` | n/a | yes |
| <a name="input_listener_protocol"></a> [listener\_protocol](#input\_listener\_protocol) | Listener protocol | `string` | n/a | yes |
| <a name="input_listener_type"></a> [listener\_type](#input\_listener\_type) | Listener type | `string` | n/a | yes |
| <a name="input_load_balancing_algorithm"></a> [load\_balancing\_algorithm](#input\_load\_balancing\_algorithm) | Specify the load balancing algorithm type | `string` | n/a | yes |
| <a name="input_loadbalancer_type"></a> [loadbalancer\_type](#input\_loadbalancer\_type) | Load balancer type | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of owner | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the alb-asg | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group id of the ec2 instance | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A list of subnet IDs to use for the resources. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags to attach to the alb-asg resources | `map(string)` | `{}` | no |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | Target group port | `number` | n/a | yes |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | Target group protocol | `string` | n/a | yes |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Target type | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to use for the resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_target_group_arn"></a> [lb\_target\_group\_arn](#output\_lb\_target\_group\_arn) | LB Target Grouparn |
| <a name="output_load_balancer_dns_name"></a> [load\_balancer\_dns\_name](#output\_load\_balancer\_dns\_name) | LoadBalancer dns name |
