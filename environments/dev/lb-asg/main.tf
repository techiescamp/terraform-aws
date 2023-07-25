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
  security_group_ids              = module.security-group.security_group_ids
}

module "asg" {
  source                          = "../../../modules/asg"
  instance_profile                = var.instance_profile
  instance_role                   = var.instance_role
  ami_id                          = var.ami_id
  instance_type                   = var.instance_type
  key_name                        = var.key_name
  vpc_id                          = var.vpc_id
  subnets                         = var.subnets
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
  security_group_ids              = module.security-group.security_group_ids
  tags = {
    Owner                         = "${var.owner}"
    Environment                   = "${var.environment}"
    Cost_center                   = "${var.cost_center}"
    Application                   = "${var.application}"
  }
}

module "security-group" {
  source                          = "../../../modules/security-group"
  region                          = var.region
  tags                            = var.tags
  name                            = var.name
  environment                     = var.environment
  owner                           = var.owner
  cost_center                     = var.cost_center
  application                     = var.application
  sg_name                         = var.sg_name
  vpc_id                          = var.vpc_id
  ingress_from_port               = var.ingress_from_port
  ingress_to_port                 = var.ingress_to_port
  ingress_protocol                = var.ingress_protocol
  ingress_cidr_block              = var.ingress_cidr_block
  egress_from_port                = var.egress_from_port
  egress_to_port                  = var.egress_to_port
  egress_protocol                 = var.egress_protocol
  egress_cidr_block               = var.egress_cidr_block
}