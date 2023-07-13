# Create a DB security group
resource "aws_security_group" "rds_security_group" {
  name        = var.sg_name
  description = "Security group for RDS instance"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_block
  }

  tags = merge(
    {
      Name        = "petclinic-alb-sg",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application,
    },
    var.tags
  )
}

resource "aws_db_instance" "rds_instance" {
  identifier                  = var.db_name
  engine                      = "mysql"
  instance_class              = var.db_instance_class
  allocated_storage           = var.db_storage_size
  storage_type                = "gp2"
  # manage_master_user_password = var.set_secret_manager_password ? true : false
  manage_master_user_password = var.set_secret_manager_password ? true : null
  username                    = var.db_username
  password                    = var.set_db_password ? var.db_password : null
  db_subnet_group_name        = "default"
  vpc_security_group_ids      = [aws_security_group.rds_security_group.id]
  backup_retention_period     = var.backup_retention_period
  multi_az                    = var.multi_az
  delete_automated_backups    = var.delete_automated_backups
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  publicly_accessible         = var.publicly_accessible
  skip_final_snapshot         = var.skip_final_snapshot
  apply_immediately           = var.apply_immediately

  tags = merge(
  {
    Name        = "petclinic-rds"
    Environment = var.environment,
    Owner       = var.owner,
    CostCenter  = var.cost_center,
    Application = var.application,
  },
  var.tags
 )
}

# Data source to retrieve RDS endpoint
data "aws_db_instance" "rds_instance" {
  db_instance_identifier = aws_db_instance.rds_instance.id
}