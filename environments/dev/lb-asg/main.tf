provider "aws" {
  region = var.region
}

module "lb-asg" {
  source        = "../../../modules/lb-asg"
  region        = var.region
  owner         = var.owner
  cost_center   = var.cost_center
  subnets       = var.subnets
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  environment   = var.environment
  vpc_id        = var.vpc_id
}