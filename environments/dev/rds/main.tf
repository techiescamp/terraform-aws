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
  set_secret_manager_password = var.set_secret_manager_password
  set_db_password = var.set_db_password
  db_password       = var.db_password
  db_name           = var.db_name
  db_instance_class = var.db_instance_class
  parameter_name    = var.parameter_name
}