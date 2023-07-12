provider "aws" {
  region = var.region
}

module "rds" {
  source            = "../../../modules/rds"
  region            = var.region
  owner             = var.owner
  cost_center       = var.cost_center
  environment       = var.environment
  db_username       = var.db_username
  db_name           = var.db_name
  db_instance_class = var.db_instance_class
  parameter_name    = var.parameter_name
}