locals {
  asg_tags = merge(
    var.tags,
    { "Name" = "${var.environment}-${var.application}-asg"  }
  )
}

resource "aws_security_group" "instance_sg" {
  name        = "${var.environment}-${var.application}-instance-sg"
  description = "Security Group for Instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = toset(range(length(var.ingress_from_port)))
    content {
      from_port   = var.ingress_from_port[ingress.key]
      to_port     = var.ingress_to_port[ingress.key]
      protocol    = var.ingress_protocol[ingress.key]
      security_groups = var.security_group_ids
    }
  }

  dynamic "egress" {
    for_each = toset(range(length(var.egress_from_port)))
    content {
      from_port   = var.egress_from_port[egress.key]
      to_port     = var.egress_to_port[egress.key]
      protocol    = var.egress_protocol[egress.key]
      cidr_blocks = var.egress_cidr_block
    }
  }

  tags = merge(
    {
      "Name"        = "${var.environment}-${var.application}-sg"
      "Environment" = var.environment
      "Owner"       = var.owner
      "CostCenter"  = var.cost_center
      "Application" = var.application
    },
    var.tags
  )

}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.environment}-${var.application}-instance_profile"

  role = var.iam_role
}

resource "aws_launch_template" "application_lt" {
  name_prefix   = "${var.environment}-${var.application}-launch_template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    name = "${var.environment}-${var.application}-instance_profile"
  }

  network_interfaces {
    associate_public_ip_address = var.public_access
    security_groups             = [aws_security_group.instance_sg.id]
  }

  user_data = base64encode(var.user_data)

}

resource "aws_autoscaling_group" "application_asg" {
  name                = "${var.environment}-${var.application}-asg"
  max_size            = var.max_size
  min_size            = var.min_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.asg_subnets

  launch_template {
    id      = aws_launch_template.application_lt.id
    version = aws_launch_template.application_lt.latest_version
  }

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }

  dynamic "tag" {
    for_each = local.asg_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }


}

resource "aws_autoscaling_attachment" "application_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
  lb_target_group_arn    = var.alb_target_group_arn
}