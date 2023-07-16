resource "aws_iam_instance_profile" "instance_profile" {
  name = var.instance_profile

  role = var.instance_roles
}

resource "aws_security_group" "lb_sg" {
  name_prefix = var.lb_security_group

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name        = "${var.name}-lb-sg",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}
resource "aws_lb" "petclinic" {
  name               = "${var.name}-lb"
  internal           = var.internal
  load_balancer_type = var.lb_type

  subnets         = var.subnets
  security_groups = [aws_security_group.alb_sg.id]

  tags = merge(
    {
      Name        = "${var.name}-lb",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_security_group" "instance_sg" {
  name_prefix = var.instance_sg

  ingress {
    from_port   = instance_from_port
    to_port     = instance_to_port
    protocol    = instance_protocol
    cidr_blocks = instance_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name        = "${var.name}-instance-sg"
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}


resource "aws_lb_target_group" "petclinic" {
  name_prefix = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = merge(
    {
      Name        = "${var.name}-lb-target-group"
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_lb_listener" "petclinic" {
  load_balancer_arn = aws_lb.petclinic.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.petclinic.arn
    type             = "forward"
  }
}

resource "aws_launch_template" "petclinic" {
  name_prefix   = "petclinic-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    name = "instance-profile"
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.instance_sg.id]
  }

  user_data = base64encode(<<-EOF
  #!/bin/bash
  bash /home/ubuntu/start.sh
  EOF
  )

}

resource "aws_autoscaling_group" "petclinic" {
  name                = "petclinic"
  max_size            = 1
  min_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = var.subnets

  launch_template {
    id      = aws_launch_template.petclinic.id
    version = aws_launch_template.petclinic.latest_version
  }

  tag {
    key                 = "Name"
    value               = "petclinic"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [load_balancers, target_group_arns]
  }

}


resource "aws_autoscaling_attachment" "petclinic" {
  autoscaling_group_name = aws_autoscaling_group.petclinic.name
  lb_target_group_arn    = aws_lb_target_group.petclinic.arn
}