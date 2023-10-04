provider "aws" {
  region = var.region
}

module "iam-policy" {
  source                      = "../../../modules/iam-policy"
  iam_policy_json_file        = var.iam_policy_json_file
  owner                       = var.owner
  environment                 = var.environment
  cost_center                 = var.cost_center
  application                 = var.application
}

module "ec2" {
  source             = "../../../modules/ec2"
  region             = var.region
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  instance_count     = var.instance_count
  subnet_ids         = var.subnet_ids
  associate_public_ip_address = var.associate_public_ip_address
  attach_instance_profile     = var.attach_instance_profile
  iam_role                    = module.iam-policy.iam_role
  security_group_ids          = module.security-group.security_group_ids
  attach_eip                  = var.attach_eip
  storage_size                = var.storage_size
  environment        = var.environment
  owner              = var.owner
  cost_center        = var.cost_center
  application        = var.application

}

module "security-group" {
  source      = "../../../modules/security-group"
  region      = var.region
  vpc_id      = var.vpc_id

  ingress_cidr_from_port     = var.ingress_cidr_from_port
  ingress_cidr_to_port       = var.ingress_cidr_to_port
  ingress_cidr_protocol      = var.ingress_cidr_protocol
  ingress_cidr_block         = var.ingress_cidr_block
  create_ingress_cidr        = var.create_ingress_cidr
  ingress_sg_from_port       = var.ingress_sg_from_port
  ingress_sg_to_port         = var.ingress_sg_to_port
  ingress_sg_protocol        = var.ingress_sg_protocol
  ingress_security_group_ids = var.ingress_security_group_ids
  create_ingress_sg          = var.create_ingress_sg
  egress_cidr_from_port      = var.egress_cidr_from_port
  egress_cidr_to_port        = var.egress_cidr_to_port
  egress_cidr_protocol       = var.egress_cidr_protocol
  egress_cidr_block          = var.egress_cidr_block
  create_egress_cidr         = var.create_egress_cidr
  egress_sg_from_port        = var.egress_sg_from_port
  egress_sg_to_port          = var.egress_sg_to_port
  egress_sg_protocol         = var.egress_sg_protocol
  egress_security_group_ids  = var.egress_security_group_ids
  create_egress_sg           = var.create_egress_sg

  environment = var.environment
  owner       = var.owner
  cost_center = var.cost_center
  application = var.application
}


