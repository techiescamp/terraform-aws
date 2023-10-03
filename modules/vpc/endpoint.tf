resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Interface"

  subnet_ids   = concat(
    aws_subnet.platform[*].id
  )
  tags = merge(
  {
      Name        = "${var.environment}-${var.application}-s3-endpoint",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
  },
  var.tags
  )
}

resource "aws_vpc_endpoint" "secrets_manager" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.secretsmanager"
  vpc_endpoint_type = "Interface"

  subnet_ids   = concat(
    aws_subnet.platform[*].id
  )
  tags = merge(
  {
      Name        = "${var.environment}-${var.application}-secrets-manager-endpoint",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
  },
  var.tags
  )
}

resource "aws_vpc_endpoint" "cloudwatch_logs" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  subnet_ids   = concat(
    aws_subnet.platform[*].id
  )
  tags = merge(
  {
      Name        = "${var.environment}-${var.application}-cloudwatch-endpoint",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
  },
  var.tags
  )
}