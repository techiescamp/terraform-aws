resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "InternetGateway",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}
