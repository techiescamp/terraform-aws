#vpc
region                        = "us-west-2"
vpc_cidr_block                = "10.0.0.0/16"
instance_tenancy              = "default"
enable_dns_support            = true
enable_dns_hostnames          = true

#elastic ip
domain                        = "vpc"

#nat-gateway
create_nat_gateway            = false

#route-table
destination_cidr_block        = "0.0.0.0/0"

#subnet
map_public_ip_on_launch       = true
public_subnet_cidr_blocks     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
app_subnet_cidr_blocks        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
db_subnet_cidr_blocks         = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
management_subnet_cidr_blocks = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
availability_zones            = ["us-west-2a", "us-west-2b", "us-west-2c"]

#tags
owner                         = "techiescamp"
environment                   = "dev"
cost_center                   = "techiescamp-commerce"
application                   = "vpc"