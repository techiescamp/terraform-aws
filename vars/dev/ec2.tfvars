# ec2 instance vars
region         = "eu-north-1"
instance_name  = "Instance"
ami_id         = "ami-0989fb15ce71ba39e"
instance_type  = "t3.micro"
key_name       = "techiescamp"
instance_count = 1
subnet_ids     = ["subnet-07fab58fa9620dfb9", "subnet-051fbcbaa925b8c44", "subnet-0c46e29a23c5ba3b8"]

# ec2_sg vars
sg_name     = "Instance_sg"
from_port   = [22, 80]
to_port     = [22, 80]
protocol    = ["tcp", "tcp"]
cidr_block  = ["0.0.0.0/0"]

# Tag keys
name        = "Instance"
owner       = "Techiescamp"
environment = ["dev"]
cost_center = "project"
application = "web-app"
