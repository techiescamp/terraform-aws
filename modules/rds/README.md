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
| [aws_db_instance.rds_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.rds_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.rds_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Name of the application | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Apply changes immediately to the RDS instance. | `bool` | n/a | yes |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The number of days to retain automated backups. | `number` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for RDS security group | `list(string)` | n/a | yes |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Copy tags to DB snapshots created from the RDS instance. | `bool` | n/a | yes |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | Name of cost-center for this RDS | `string` | n/a | yes |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | The database engine | `string` | n/a | yes |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The RDS instance class | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for RDS | `string` | n/a | yes |
| <a name="input_db_storage_size"></a> [db\_storage\_size](#input\_db\_storage\_size) | The allocated storage size for the RDS instance. | `number` | n/a | yes |
| <a name="input_db_storage_type"></a> [db\_storage\_type](#input\_db\_storage\_type) | The storage type for the database | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The username for the RDS database | `string` | n/a | yes |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | Enable deletion of automated backups when the RDS instance is deleted. | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name for the resources. | `any` | n/a | yes |
| <a name="input_from_port"></a> [from\_port](#input\_from\_port) | The starting port for ingress rules | `number` | n/a | yes |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Enable multi-AZ deployment for the RDS instance. | `bool` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of the owner for this RDS | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol for ingress rules | `string` | n/a | yes |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Allow the RDS instance to be publicly accessible. | `bool` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the rds | `string` | n/a | yes |
| <a name="input_set_db_password"></a> [set\_db\_password](#input\_set\_db\_password) | Condition to check for custom password | `string` | n/a | yes |
| <a name="input_set_secret_manager_password"></a> [set\_secret\_manager\_password](#input\_set\_secret\_manager\_password) | To enable master user password or not | `bool` | `false` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Skip the creation of a final DB snapshot when the RDS instance is deleted. | `bool` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The IDs of the subnets | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags to attach to the RDS resources | `map(string)` | `{}` | no |
| <a name="input_to_port"></a> [to\_port](#input\_to\_port) | The ending port for ingress rules | `number` | n/a | yes |
| <a name="input_update_rds_endpoint"></a> [update\_rds\_endpoint](#input\_update\_rds\_endpoint) | n/a | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_master_user_secret"></a> [master\_user\_secret](#output\_master\_user\_secret) | The address of the RDS instance |
| <a name="output_rds_address"></a> [rds\_address](#output\_rds\_address) | The address of the RDS instance |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | The address of the RDS instance |
