provider "aws" {
  region = var.region
}

module "rds" {
  source                      = "../../../modules/rds"
  region                      = var.region
  db_username                 = var.db_username
  set_secret_manager_password = var.set_secret_manager_password
  set_db_password             = var.set_db_password
  db_password                 = var.db_password
  db_name                     = var.db_name
  db_instance_class           = var.db_instance_class
  db_storage_size             = var.db_storage_size
  sg_name                     = var.sg_name
  cidr_block                  = var.cidr_block
  backup_retention_period     = var.backup_retention_period
  multi_az                    = var.multi_az
  delete_automated_backups    = var.delete_automated_backups
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  publicly_accessible         = var.publicly_accessible
  skip_final_snapshot         = var.skip_final_snapshot
  apply_immediately           = var.apply_immediately
  owner                       = var.owner
  cost_center                 = var.cost_center
  environment                 = var.environment
  application                 = var.application
}