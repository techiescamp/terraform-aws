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
  security_group_ids = var.security_group_ids
}
