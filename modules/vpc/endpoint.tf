resource "aws_vpc_endpoint" "s3" {
  count              = var.create_s3_endpoint ? 1 : 0
  vpc_id             = aws_vpc.main.id
  service_name       = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type  = "Interface"

  subnet_ids         = concat(
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
  count              = var.create_secrets_manager_endpoint ? 1 : 0
  vpc_id             = aws_vpc.main.id
  service_name       = "com.amazonaws.${var.region}.secretsmanager"
  vpc_endpoint_type  = "Interface"

  subnet_ids         = concat(
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
  count              = var.create_cloudwatch_logs_endpoint ? 1 : 0
  vpc_id             = aws_vpc.main.id
  service_name       = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type  = "Interface"

  subnet_ids         = concat(
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
