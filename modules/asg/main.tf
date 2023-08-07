locals {
  asg_tags = merge(
    var.tags,
    { "Name" = "${var.environment}-${var.application}-asg"  }
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
    security_groups             = var.security_group_ids
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

resource "aws_autoscaling_policy" "cpu_scaling_policy" {
  name                   = "${var.environment}-${var.application}-cpu-scaling-policy"
  policy_type            = "TargetTrackingScaling"
  estimated_instance_warmup = var.instance_warmup_time
  autoscaling_group_name = aws_autoscaling_group.application_asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_value
  }
}


resource "aws_autoscaling_attachment" "application_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
  lb_target_group_arn    = var.alb_target_group_arn
}