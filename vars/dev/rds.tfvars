# Network Vars
region                      = "us-west-2"
subnet_ids                  = ["subnet-058a7514ba8adbb07", "subnet-0dbcd1ac168414927", "subnet-032f5077729435858"]
multi_az                    = false
publicly_accessible         = true

# DB Vars
db_engine                   = "mysql"
db_storage_type             = "gp2"
db_username                 = "techiescamp"
db_instance_class           = "db.t2.micro"
db_storage_size             = 20
set_secret_manager_password = true
set_db_password             = false
db_password                 = "rdssecret"

# Security Group Vars
from_port                   = 3306
to_port                     = 3306
protocol                    = "tcp"
cidr_block                  = ["0.0.0.0/0"]

# Backup vars
backup_retention_period     = 7
delete_automated_backups    = true
copy_tags_to_snapshot       = true
skip_final_snapshot         = true
apply_immediately           = true

# Tag Vars
owner                       = "techiescamp-devops"
environment                 = "dev"
cost_center                 = "techiescamp"
application                 = "techiescamp-commerce"