resource "aws_security_group" "lb_sg" {
  name_prefix = "${var.environment}-${var.application}-lb-sg"

  ingress {
    from_port   = var.lb_from_port
    to_port     = var.lb_to_port
    protocol    = var.lb_protocol
    cidr_blocks = var.lb_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-lb-sg",
      Environment = var.environment,
      OwnerName   = var.owner,
      Cost_Center = var.cost_center,
      AppName     = var.application
    },
    var.tags
  )
}
resource "aws_lb" "load_balancer" {
  name               = "${var.environment}-${var.application}-lb"
  internal           = var.internal
  load_balancer_type = var.lb_type

  subnets         = var.subnets
  security_groups = [aws_security_group.lb_sg.id]

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-lb",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_lb_target_group" "lb_tg" {
  name_prefix = "lb-tg"
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
    healthy_threshold   = var.health_check_healthy_treshold
    unhealthy_threshold = var.health_check_unhealthy_treshold
  }

  load_balancing_algorithm_type = var.load_balancing_algorithm

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-lb-target-group"
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_lb_listener" "application_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    target_group_arn = aws_lb_target_group.lb_tg.arn
    type             = var.listener_type
  }
}
