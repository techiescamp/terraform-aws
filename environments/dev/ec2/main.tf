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
  security_group_ids = module.ec2-sg.security_group_ids
}

module "ec2-sg" {
  source      = "../../../modules/ec2-sg"
  region      = var.region
  tags        = var.tags
  name        = var.name
  environment = var.environment
  owner       = var.owner
  cost_center = var.cost_center
  application = var.application
  sg_name     = var.sg_name
  from_port   = var.from_port
  to_port     = var.to_port
  protocol    = var.protocol
  cidr_block  = var.cidr_block
}
