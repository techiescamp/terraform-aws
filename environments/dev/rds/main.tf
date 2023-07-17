provider "aws" {
  region = var.region
}

module "rds" {
  source                      = "../../../modules/rds"
  region                      = var.region
  subnet_ids = var.subnet_ids
  db_engine                   = var.db_engine
  db_storage_type             = var.db_storage_type
  db_username                 = var.db_username
  set_secret_manager_password = var.set_secret_manager_password
  set_db_password             = var.set_db_password
  db_password                 = var.db_password
  db_instance_class           = var.db_instance_class
  db_storage_size             = var.db_storage_size
  from_port                   = var.from_port
  to_port                     = var.to_port
  protocol                    = var.protocol
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