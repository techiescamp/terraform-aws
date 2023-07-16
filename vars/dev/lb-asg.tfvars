region        = "us-west-2"
# iam_role
instance_profile = "FullAccessProfile"
instance_role = "instance_role"
# lb_sg
lb_security_group = "lb-sg"
lb_from_port = 0
lb_to_port = 65535
lb_protocol = "tcp"
lb_cidr_block = ["0.0.0.0/0"]
internal = false
lb_type = "application"
# insatnce_sg
instance_sg = "petclinic_instance_sg"
instance_from_port = 0
instance_to_port = 65535
instance_protocol = "tcp"
instance_cidr_block = ["0.0.0.0/0"]
# target_group
target_group_name = "pc-lb"
target_group_port = 8080
target_group_protocol = "HTTP"
target_type = "instance"
# health_check
health_check_path = "/"
health_check_port = 8080
health_check_protocol = "HTTP"
health_check_interval = 30
health_check_timeout = 5
health_check_healthy_treshold = 2
health_check_unhealthy_treshold = 2

ami_id        = "ami-08076abdd4bdb9b18"
instance_type = "t2.medium"
key_name      = "aswin-key"
vpc_id        = "vpc-0a5ca4a92c2e10163"
subnets       = ["subnet-058a7514ba8adbb07", "subnet-0dbcd1ac168414927", "subnet-032f5077729435858"]

name          = "petclinic"
owner         = "Techiescamp"
environment   = "dev"
cost_center   = "project-pet-clinic"
application = "pet-clinic"
