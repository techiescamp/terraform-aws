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
  name                            = "${var.environment}-${var.application}"
  environment                     = var.environment
  owner                           = var.owner
  cost_center                     = var.cost_center
  application                     = "${var.application}-alb"
  vpc_id                          = var.vpc_id

  ingress_cidr_from_port          = var.alb_ingress_cidr_from_port
  ingress_cidr_to_port            = var.alb_ingress_cidr_to_port
  ingress_cidr_protocol           = var.ingress_cidr_protocol
  ingress_cidr_block              = var.alb_ingress_cidr_block
  create_ingress_cidr             = var.alb_create_ingress_cidr

  ingress_sg_from_port            = var.alb_ingress_sg_from_port
  ingress_sg_to_port              = var.alb_ingress_sg_to_port
  ingress_sg_protocol             = var.alb_ingress_sg_protocol
  ingress_security_group_ids      = var.ingress_security_group_ids
  create_ingress_sg               = var.alb_create_ingress_sg

  egress_cidr_from_port           = var.alb_egress_cidr_from_port
  egress_cidr_to_port             = var.alb_egress_cidr_to_port
  egress_cidr_protocol            = var.alb_egress_cidr_protocol
  egress_cidr_block               = var.alb_egress_cidr_block
  create_egress_cidr              = var.alb_create_egress_cidr

  egress_sg_from_port             = var.alb_egress_sg_from_port
  egress_sg_to_port               = var.alb_egress_sg_to_port
  egress_sg_protocol              = var.alb_egress_sg_protocol
  egress_security_group_ids       = var.egress_security_group_ids
  create_egress_sg                = var.alb_create_egress_sg
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
  health_check_healthy_threshold  = var.health_check_healthy_threshold
  health_check_unhealthy_threshold= var.health_check_unhealthy_threshold
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
  name                            = "${var.environment}-${var.application}"
  environment                     = var.environment
  owner                           = var.owner
  cost_center                     = var.cost_center
  application                     = var.application
  vpc_id                          = var.vpc_id

  ingress_cidr_from_port          = var.ingress_cidr_from_port
  ingress_cidr_to_port            = var.ingress_cidr_to_port
  ingress_cidr_protocol           = var.ingress_cidr_protocol
  ingress_cidr_block              = var.ingress_cidr_block
  create_ingress_cidr             = var.create_ingress_cidr

  ingress_sg_from_port            = var.ingress_sg_from_port
  ingress_sg_to_port              = var.ingress_sg_to_port
  ingress_sg_protocol             = var.ingress_sg_protocol
  ingress_security_group_ids      = module.alb-sg.security_group_ids
  create_ingress_sg               = var.create_ingress_sg

  egress_cidr_from_port           = var.egress_cidr_from_port
  egress_cidr_to_port             = var.egress_cidr_to_port
  egress_cidr_protocol            = var.egress_cidr_protocol
  egress_cidr_block               = var.egress_cidr_block
  create_egress_cidr              = var.create_egress_cidr

  egress_sg_from_port             = var.egress_sg_from_port
  egress_sg_to_port               = var.egress_sg_to_port
  egress_sg_protocol              = var.egress_sg_protocol
  egress_security_group_ids       = module.alb-sg.security_group_ids
  create_egress_sg                = var.create_egress_sg
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
  instance_warmup_time            = var.instance_warmup_time
  target_value                    = var.target_value
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

