provider "aws" {
  region = var.region
}

module "iam-policy" {
  source                          = "../../../modules/iam-policy"
  instance_role                   = var.instance_role
}

module "lb" {
  source                          = "../../../modules/lb"
  region                          = var.region
  lb_from_port                    = var.lb_from_port
  lb_to_port                      = var.lb_to_port
  lb_protocol                     = var.lb_protocol
  lb_cidr_block                   = var.lb_cidr_block
  internal                        = var.internal
  lb_type                         = var.lb_type
  vpc_id                          = var.vpc_id
  subnets                         = var.subnets
  target_group_port               = var.target_group_port
  target_group_protocol           = var.target_group_protocol
  target_type                     = var.target_type
  load_balancing_algorithm        = var.load_balancing_algorithm
  health_check_path               = var.health_check_path
  health_check_port               = var.health_check_port
  health_check_protocol           = var.health_check_protocol
  health_check_interval           = var.health_check_interval
  health_check_timeout            = var.health_check_timeout
  health_check_healthy_treshold   = var.health_check_healthy_treshold
  health_check_unhealthy_treshold = var.health_check_unhealthy_treshold
  listener_port                   = var.listener_port
  listener_protocol               = var.listener_protocol
  listener_type                   = var.listener_type
  owner                           = var.owner
  environment                     = var.environment
  cost_center                     = var.cost_center
  application                     = var.application
}

module "asg" {
  source                          = "../../../modules/asg"
  instance_profile                = var.instance_profile
  instance_role                   = var.instance_role
  instance_from_port              = var.instance_from_port
  instance_to_port                = var.instance_to_port
  instance_protocol               = var.instance_protocol
  instance_cidr_block             = var.instance_cidr_block
  ami_id                          = var.ami_id
  instance_type                   = var.instance_type
  key_name                        = var.key_name
  vpc_id                          = var.vpc_id
  subnets                         = var.subnets
  security_group_ids              = var.security_group_ids
  public_access                   = var.public_access
  user_data                       = var.user_data
  max_size                        = var.max_size
  min_size                        = var.min_size
  desired_capacity                = var.desired_capacity
  propagate_at_launch             = var.propagate_at_launch
  owner                           = var.owner
  environment                     = var.environment
  cost_center                     = var.cost_center
  application                     = var.application
  lb_target_group_arn             = module.lb.lb_target_group_arn
  iam_role                        = module.iam-policy.iam_role
}