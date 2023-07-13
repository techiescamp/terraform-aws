terraform {
  backend "s3" {}
}
provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source                        = "../../../modules/vpc"
  name                          = "eks-vpc"
  region                        = "us-west-2"
  project                       = "EKS Demo"
  environment                   = "dev"
  vpc_cidr_block                = "10.0.0.0/16"
  public_subnet_cidr_blocks     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  app_subnet_cidr_blocks        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  db_subnet_cidr_blocks         = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
  management_subnet_cidr_blocks = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  availability_zones            = ["us-west-2a", "us-west-2b", "us-west-2c"]
}