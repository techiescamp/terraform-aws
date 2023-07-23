provider "aws" {
  region = var.region
}

module "ec2" {
  source             = "../../../modules/ec2"
  region             = var.region
  instance_name      = var.instance_name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  instance_count     = var.instance_count
  subnet_ids         = var.subnet_ids
  name               = var.name
  environment        = var.environment
  owner              = var.owner
  cost_center        = var.cost_center
  application        = var.application
  security_group_ids = module.security-group.security_group_ids
}

module "security-group" {
  source             = "../../../modules/security-group"
  region             = var.region
  tags               = var.tags
  name               = var.name
  environment        = var.environment
  owner              = var.owner
  cost_center        = var.cost_center
  application        = var.application
  sg_name            = var.sg_name
  vpc_id             = var.vpc_id
  ingress_from_port  = var.ingress_from_port
  ingress_to_port    = var.ingress_to_port
  ingress_protocol   = var.ingress_protocol
  ingress_cidr_block = var.ingress_cidr_block
  egress_from_port   = var.egress_from_port
  egress_to_port     = var.egress_to_port
  egress_protocol    = var.egress_protocol
  egress_cidr_block  = var.egress_cidr_block
}
