# EC2 Instance Variables
region         = "us-west-2"
ami_id         = "ami-03f65b8614a860c29"
instance_type  = "t2.micro"
key_name       = "techiescamp"
instance_count = 1
subnet_ids     = ["subnet-058a7514ba8adbb07", "subnet-04b1f595ef8c29542", "subnet-032f5077729435858"]

# EC2 Security Group Variables
vpc_id  = "vpc-0a5ca4a92c2e10163"

# Tag Keys
name        = ""
owner       = "techiescamp"
environment = ""
cost_center = "techiescamp-commerce"
application = ""

# CIDR Ingress Variables
create_ingress_cidr    = true
ingress_cidr_from_port = [22]
ingress_cidr_to_port   = [22]
ingress_cidr_protocol  = ["tcp"]
ingress_cidr_block     = ["10.10.0.0/16"]

# Security Group Ingress Variables
create_ingress_sg          = false
ingress_sg_from_port       = [80]
ingress_sg_to_port         = [80]
ingress_sg_protocol        = ["tcp"]
ingress_security_group_ids = ["sg-0fe4363da3994c100"]

# CIDR Egress Variables
create_egress_cidr    = true
egress_cidr_from_port = [0]
egress_cidr_to_port   = [0]
egress_cidr_protocol  = ["-1"]
egress_cidr_block     = ["0.0.0.0/0"]

# Security Group Egress Variables
create_egress_sg          = false
egress_sg_from_port       = [0]
egress_sg_to_port         = [0]
egress_sg_protocol        = ["-1"]
egress_security_group_ids = ["sg-0fe4363da3994c100"]
