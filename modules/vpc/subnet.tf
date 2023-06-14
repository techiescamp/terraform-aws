resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name        = "PublicSubnet",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_subnet" "app" {
  count             = length(var.app_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.app_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "AppSubnet",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_subnet" "db" {
  count             = length(var.db_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "DbSubnet",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_subnet" "management" {
  count             = length(var.management_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.management_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "ManagementSubnet",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}