terraform {
  backend "s3" {}
}
provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source                        = "../../../modules/vpc"
  region                        = var.region
  vpc_cidr_block                = var.vpc_cidr_block
  instance_tenancy              = var.instance_tenancy
  enable_dns_support            = var.enable_dns_support
  enable_dns_hostnames          = var.enable_dns_hostnames
  domain                        = var.domain
  create_nat_gateway            = var.create_nat_gateway
  destination_cidr_block        = var.destination_cidr_block
  map_public_ip_on_launch       = var.map_public_ip_on_launch
  public_subnet_cidr_blocks     = var.public_subnet_cidr_blocks
  app_subnet_cidr_blocks        = var.app_subnet_cidr_blocks
  db_subnet_cidr_blocks         = var.db_subnet_cidr_blocks
  management_subnet_cidr_blocks = var.management_subnet_cidr_blocks
  availability_zones            = var.availability_zones
  owner                         = var.owner
  environment                   = var.environment
  cost_center                   = var.cost_center
  application                   = var.application
}