resource "aws_eip" "main" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id
  depends_on    = [aws_internet_gateway.main]

  tags = merge(
    {
      Name        = "NATGateway",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

