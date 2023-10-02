resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Interface"

  subnet_ids   = concat(
    aws_subnet.platform[*].id
  )
}

resource "aws_vpc_endpoint" "secrets_manager" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.secretsmanager"
  vpc_endpoint_type = "Interface"

  subnet_ids   = concat(
    aws_subnet.platform[*].id
  )
}

resource "aws_vpc_endpoint" "cloudwatch_logs" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  subnet_ids   = concat(
    aws_subnet.platform[*].id
  )
}