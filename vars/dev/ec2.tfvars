# EC2 Instance Variables
region         = "eu-north-1"
instance_name  = "Instance"
ami_id         = "ami-0989fb15ce71ba39e"
instance_type  = "t3.micro"
key_name       = "techiescamp"
instance_count = 1
subnet_ids = ["subnet-07fab58fa9620dfb9",
  "subnet-051fbcbaa925b8c44",
"subnet-0c46e29a23c5ba3b8"]

# EC2 Security Group Variables
sg_name = "Instance_sg"
vpc_id  = "vpc-07d73d0c9081754d0"

# Tag Keys
name        = "Instance"
owner       = "Techiescamp"
environment = "dev"
cost_center = "project"
application = "web-app"

# Security Group Ingress Variables
ingress_cidr_from_port = [22]
ingress_cidr_to_port   = [22]
ingress_cidr_protocol  = ["tcp"]
ingress_cidr_block     = ["10.10.0.0/16"]
create_ingress_cidr    = false

ingress_sg_from_port       = [80]
ingress_sg_to_port         = [80]
ingress_sg_protocol        = ["tcp"]
ingress_security_group_ids = ["sg-0aa656667277a3e65"]
create_ingress_sg          = false

# Security Group Egress Variables
egress_cidr_from_port = [443]
egress_cidr_to_port   = [443]
egress_cidr_protocol  = ["tcp"]
egress_cidr_block     = ["10.20.0.0/16"]
create_egress_cidr    = false

egress_sg_from_port       = [8080]
egress_sg_to_port         = [8080]
egress_sg_protocol        = ["tcp"]
egress_security_group_ids = ["sg-0aa656667277a3e65"]
create_egress_sg          = false