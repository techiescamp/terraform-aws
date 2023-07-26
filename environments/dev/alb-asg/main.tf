provider "aws" {
  region = var.region
}

module "iam-policy" {
  source                          = "../../../modules/iam-policy"
  owner                           = var.owner
  environment                     = var.environment
  cost_center                     = var.cost_center
  application                     = var.application
}

module "alb-sg" {
  source                          = "../../../modules/security-group"
  region                          = var.region
  tags                            = var.tags
  environment                     = var.environment
  owner                           = var.owner
  cost_center                     = var.cost_center
  application                     ="${var.application}-alb"
  vpc_id                          = var.vpc_id
  ingress_from_port               = var.alb_ingress_from_port
  ingress_to_port                 = var.alb_ingress_to_port
  ingress_protocol                = var.alb_ingress_protocol
  ingress_cidr_block              = var.alb_ingress_cidr_block
  egress_from_port                = var.alb_egress_from_port
  egress_to_port                  = var.alb_egress_to_port
  egress_protocol                 = var.alb_egress_protocol
  egress_cidr_block               = var.alb_egress_cidr_block
}

module "alb" {
  source                          = "../../../modules/alb"
  region                          = var.region
  internal                        = var.internal
  loadbalancer_type               = var.loadbalancer_type
  vpc_id                          = var.vpc_id
  alb_subnets                     = var.alb_subnets
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
  security_group_ids              = module.alb-sg.security_group_ids
}

module "instance-sg" {
  source                          = "../../../modules/security-group"
  region                          = var.region
  tags                            = var.tags
  environment                     = var.environment
  owner                           = var.owner
  cost_center                     = var.cost_center
  application                     = var.application
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

module "asg" {
  source                          = "../../../modules/asg"
  ami_id                          = var.ami_id
  instance_type                   = var.instance_type
  key_name                        = var.key_name
  vpc_id                          = var.vpc_id
  asg_subnets                     = var.asg_subnets
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
  alb_target_group_arn            = module.alb.alb_target_group_arn
  iam_role                        = module.iam-policy.iam_role
  security_group_ids              = module.instance-sg.security_group_ids
  tags = {
    Owner                         = "${var.owner}"
    Environment                   = "${var.environment}"
    Cost_center                   = "${var.cost_center}"
    Application                   = "${var.application}"
  }
}

