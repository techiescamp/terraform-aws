resource "aws_network_acl" "public" {
    vpc_id = aws_vpc.main.id

    egress {
        protocol   = "-1"
        rule_no    = 200
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }
    tags = merge(
    {
        Name        = "${var.environment}-${var.application}-public-subnet-nacl",
        Environment = var.environment,
        Owner       = var.owner,
        CostCenter  = var.cost_center,
        Application = var.application
    },
    var.tags
    )
}

resource "aws_network_acl" "app" {
    vpc_id = aws_vpc.main.id

    egress {
        protocol   = "-1"
        rule_no    = 200
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }
    tags = merge(
    {
        Name        = "${var.environment}-${var.application}-app-subnet-nacl",
        Environment = var.environment,
        Owner       = var.owner,
        CostCenter  = var.cost_center,
        Application = var.application
    },
    var.tags
    )
}

resource "aws_network_acl" "db" {
    vpc_id = aws_vpc.main.id

    egress {
        protocol   = "-1"
        rule_no    = 200
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }
    tags = merge(
    {
        Name        = "${var.environment}-${var.application}-db-subnet-nacl",
        Environment = var.environment,
        Owner       = var.owner,
        CostCenter  = var.cost_center,
        Application = var.application
    },
    var.tags
    )
}

resource "aws_network_acl" "management" {
    vpc_id = aws_vpc.main.id

    egress {
        protocol   = "-1"
        rule_no    = 200
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }
    tags = merge(
    {
        Name        = "${var.environment}-${var.application}-management-subnet-nacl",
        Environment = var.environment,
        Owner       = var.owner,
        CostCenter  = var.cost_center,
        Application = var.application
    },
    var.tags
    )
}

resource "aws_network_acl" "platform" {
    vpc_id = aws_vpc.main.id

    egress {
        protocol   = "-1"
        rule_no    = 200
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }
    tags = merge(
    {
        Name        = "${var.environment}-${var.application}-platform-subnet-nacl",
        Environment = var.environment,
        Owner       = var.owner,
        CostCenter  = var.cost_center,
        Application = var.application
    },
    var.tags
    )
}

resource "aws_network_acl_association" "public" {
    count          = length(aws_subnet.public)
    subnet_id      = aws_subnet.public[count.index].id
    network_acl_id = aws_network_acl.public.id
}

resource "aws_network_acl_association" "app" {
    count          = length(aws_subnet.app)
    subnet_id      = aws_subnet.app[count.index].id
    network_acl_id = aws_network_acl.app.id
}

resource "aws_network_acl_association" "db" {
    count          = length(aws_subnet.db)
    subnet_id      = aws_subnet.db[count.index].id
    network_acl_id = aws_network_acl.db.id
}

resource "aws_network_acl_association" "management" {
    count          = length(aws_subnet.management)
    subnet_id      = aws_subnet.management[count.index].id
    network_acl_id = aws_network_acl.management.id
}

resource "aws_network_acl_association" "platform" {
    count          = length(aws_subnet.platform)
    subnet_id      = aws_subnet.platform[count.index].id
    network_acl_id = aws_network_acl.platform.id
}
