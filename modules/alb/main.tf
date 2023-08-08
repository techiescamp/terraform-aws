resource "aws_alb" "application_load_balancer" {
  name               = "${var.environment}-${var.application}-alb"
  internal           = var.internal
  load_balancer_type = var.loadbalancer_type

  subnets         = var.alb_subnets
  security_groups = var.security_group_ids

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-alb",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_alb_target_group" "alb_tg" {
  name_prefix = "alb-tg"
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

  load_balancing_algorithm_type = var.load_balancing_algorithm

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-alb-target-group"
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_alb_listener" "application_listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.arn
    type             = var.listener_type
  }
}
