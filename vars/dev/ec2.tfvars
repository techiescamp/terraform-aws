#IAM Policy
iam_policy_json_file = "ec2.json"

# EC2 Instance Variables
region                      = "us-west-2"
ami_id                      = "ami-0e8ffa060937e44c7"
instance_type               = "t2.micro"
key_name                    = "techiescamp"
instance_count              = 1
subnet_ids                  = ["subnet-034b5b81e1ee5e653", "subnet-0bfbbe8efe880be15", "subnet-059ad803aa3c5d9c5"]
associate_public_ip_address = true
attach_instance_profile     = true
attach_eip                  = false
storage_size                = 30

# EC2 Security Group Variables
vpc_id = "vpc-062e91b98392ca9a2"

# Tag Keys
owner       = "techiescamp"
environment = "test"
cost_center = "techiescamp-commerce"
application = "jenkins-agent"

# CIDR Ingress Variables
create_ingress_cidr    = true
ingress_cidr_from_port = [22, 8080]
ingress_cidr_to_port   = [22, 8080]
ingress_cidr_protocol  = ["tcp", "tcp"]
ingress_cidr_block     = ["0.0.0.0/0", "0.0.0.0/0"]

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
