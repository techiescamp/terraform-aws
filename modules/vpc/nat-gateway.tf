resource "aws_eip" "main" {
  count = 3
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  count         = length(var.subnet_ids)
  allocation_id = aws_eip.main[count.index].id
  subnet_id     = aws_subnet.public[0].id

    tags = merge(
    {
      Name        = "NATGateway",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}
