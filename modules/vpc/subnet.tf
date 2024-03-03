resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-public-subnet-${count.index}",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "app" {
  count             = length(var.app_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.app_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-app-subnet-${count.index}",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route_table_association" "app" {
  count          = length(aws_subnet.app)
  subnet_id      = aws_subnet.app[count.index].id
  route_table_id = aws_route_table.app.id
}

resource "aws_subnet" "db" {
  count             = length(var.db_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-db-subnet-${count.index}",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route_table_association" "db" {
  count          = length(aws_subnet.db)
  subnet_id      = aws_subnet.db[count.index].id
  route_table_id = aws_route_table.db.id
}

resource "aws_subnet" "management" {
  count             = length(var.management_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.management_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-management-subnet-${count.index}",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route_table_association" "management" {
  count          = length(aws_subnet.management)
  subnet_id      = aws_subnet.management[count.index].id
  route_table_id = aws_route_table.management.id
}

resource "aws_subnet" "platform" {
  count             = length(var.platform_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.platform_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-platform-subnet-${count.index}",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route_table_association" "platform" {
  count          = length(aws_subnet.platform)
  subnet_id      = aws_subnet.platform[count.index].id
  route_table_id = aws_route_table.platform.id
}
