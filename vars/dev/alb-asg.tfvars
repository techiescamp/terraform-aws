region = "us-west-2"

# alb
internal          = false
loadbalancer_type = "application"
alb_subnets       = ["subnet-058a7514ba8adbb07", "subnet-0dbcd1ac168414927", "subnet-032f5077729435858"]

#alb-sg
alb_ingress_cidr_from_port = [80]
alb_ingress_cidr_to_port   = [80]
alb_ingress_cidr_protocol  = ["tcp"]
alb_ingress_cidr_block     = ["0.0.0.0/0"]
alb_create_ingress_cidr    = true

alb_ingress_sg_from_port = [8080]
alb_ingress_sg_to_port   = [8080]
alb_ingress_sg_protocol  = ["tcp"]
alb_create_ingress_sg    = false

alb_egress_cidr_from_port = [0]
alb_egress_cidr_to_port   = [0]
alb_egress_cidr_protocol  = ["-1"]
alb_egress_cidr_block     = ["0.0.0.0/0"]
alb_create_egress_cidr    = true

alb_egress_sg_from_port = [0]
alb_egress_sg_to_port   = [0]
alb_egress_sg_protocol  = ["-1"]
alb_create_egress_sg    = false

# instance sg
ingress_cidr_from_port = [22]
ingress_cidr_to_port   = [22]
ingress_cidr_protocol  = ["tcp"]
ingress_cidr_block     = ["0.0.0.0/0"]
create_ingress_cidr    = true

ingress_sg_from_port = [8080]
ingress_sg_to_port   = [8080]
ingress_sg_protocol  = ["tcp"]
create_ingress_sg    = true

egress_cidr_from_port = [0]
egress_cidr_to_port   = [0]
egress_cidr_protocol  = ["-1"]
egress_cidr_block     = ["0.0.0.0/0"]
create_egress_cidr    = true

egress_sg_from_port = [8080]
egress_sg_to_port   = [8080]
egress_sg_protocol  = ["tcp"]
create_egress_sg    = false

# target_group
target_group_port        = 8080
target_group_protocol    = "HTTP"
target_type              = "instance"
load_balancing_algorithm = "round_robin"

# health_check
health_check_path                = "/"
health_check_port                = 8080
health_check_protocol            = "HTTP"
health_check_interval            = 30
health_check_timeout             = 5
health_check_healthy_threshold   = 2
health_check_unhealthy_threshold = 2

#alb_listener
listener_port     = 80
listener_protocol = "HTTP"
listener_type     = "forward"

#launch_template
ami_id        = "ami-020f3ca563c92097b"
instance_type = "t2.medium"
key_name      = "techiescamp"
vpc_id        = "vpc-0a5ca4a92c2e10163"
asg_subnets   = ["subnet-058a7514ba8adbb07", "subnet-0dbcd1ac168414927", "subnet-032f5077729435858"]
public_access = true

#user_data
user_data = <<-EOF
                                    #!/bin/bash
                                    bash /home/ubuntu/start.sh
                                   EOF

#autoscaling_group
max_size             = 2
min_size             = 1
desired_capacity     = 1
propagate_at_launch  = true
instance_warmup_time = 30
target_value         = 50

#tags
owner       = "techiescamp"
environment = "dev"
cost_center = "techiescamp-commerce"
application = "java-app"

