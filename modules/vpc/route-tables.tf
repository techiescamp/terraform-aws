resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "PublicRouteTable",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "AppRouteTable",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "app" {
  count = var.create_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.app.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main[count.index].id
}


resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "DbRouteTable",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "db" {
  count = var.create_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.db.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main[count.index].id
}

resource "aws_route_table" "management" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name        = "ManagementRouteTable",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "management" {
  count = var.create_nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.management.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main[count.index].id
}