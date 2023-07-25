# iam_role
instance_profile               = "FullAccessProfile"
instance_role                  = "demo_role"

# lb
internal                       = false
lb_type                        = "application"

# security group
sg_name                        = "app_sg"
ingress_from_port              = [22, 8080]
ingress_to_port                = [22, 8080]
ingress_protocol               = ["tcp", "tcp"]
ingress_cidr_block             = ["0.0.0.0/0"]
egress_from_port               = [0]
egress_to_port                 = [0]
egress_protocol                = ["-1"]
egress_cidr_block              = ["0.0.0.0/0"]

# target_group
target_group_port              = 8080
target_group_protocol          = "HTTP"
target_type                    = "instance"
load_balancing_algorithm       = "round_robin"

# health_check
health_check_path               = "/"
health_check_port               = 8080
health_check_protocol           = "HTTP"
health_check_interval           = 30
health_check_timeout            = 5
health_check_healthy_treshold   = 2
health_check_unhealthy_treshold = 2

#lb_listener
listener_port                   = 80
listener_protocol               = "HTTP"
listener_type                   = "forward"

#launch_template
region                           = "us-west-2"
ami_id                           = "ami-020f3ca563c92097b"
instance_type                    = "t2.medium"
key_name                         = "aswin-key"
vpc_id                           = "vpc-0a5ca4a92c2e10163"
subnets                          = ["subnet-058a7514ba8adbb07", "subnet-0dbcd1ac168414927", "subnet-032f5077729435858"]
security_group_ids               = ["sg-056e31eec8fdb151f"]
public_access                    = true

#user_data
user_data                        = <<-EOF
                                    #!/bin/bash
                                    bash /home/ubuntu/start.sh
                                EOF

#autoscaling_group
max_size                         = 1
min_size                         = 1
desired_capacity                 = 1
propagate_at_launch              = true

#tags
name                             = "lb-asg"
owner                            = "techiescamp-devops"
environment                      = "dev"
cost_center                      = "techiescamp"
application                      = "techiescamp-commerce"
