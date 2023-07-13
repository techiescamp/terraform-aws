# Create a DB security group
resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Security group for RDS instance"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name        = "petclinic-alb-sg",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = "petclinic-rds-sg"
    },
    var.tags
  )
}

resource "aws_db_instance" "rds_instance" {
  identifier                  = var.db_name
  engine                      = "mysql"
  instance_class              = var.db_instance_class
  allocated_storage           = 10
  storage_type                = "gp2"
  # manage_master_user_password = var.set_secret_manager_password ? true : false
  manage_master_user_password = var.set_secret_manager_password ? true : null
  username                    = var.db_username
  password                    = var.set_db_password ? var.db_password : null
  db_subnet_group_name        = "default"
  vpc_security_group_ids      = [aws_security_group.rds_security_group.id]
  backup_retention_period     = 7
  delete_automated_backups    = true
  copy_tags_to_snapshot       = true
  publicly_accessible         = true
  skip_final_snapshot         = true
  apply_immediately           = true

  tags = merge(
  {
    Name        = "petclinic-rds"
    Environment = var.environment,
    Owner       = var.owner,
    CostCenter  = var.cost_center,
    Application = "pet-clinic"
  },
  var.tags
 )
}

# Data source to retrieve RDS endpoint
data "aws_db_instance" "rds_instance" {
  db_instance_identifier = aws_db_instance.rds_instance.id
}


# resource "aws_ssm_parameter" "rds_endpoint" {
#   name  = var.parameter_name
#   type  = "String"
#   value = data.aws_db_instance.rds_instance.endpoint
# }

# resource "local_file" "password_file" {
#   count      = var.manage_master_user_password ? 0 : 1
#   filename   = "password.txt"
#   content    = var.db_password
# }
