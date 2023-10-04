resource "aws_network_acl" "public" {
    vpc_id = aws_vpc.main.id

    dynamic "ingress" {
        for_each = toset(range(length(var.ingress_public_nacl_from_port)))
        content {
            rule_no    = var.ingress_public_nacl_rule_no[ingress.key]
            action     = var.ingress_public_nacl_action[ingress.key]
            from_port  = var.ingress_public_nacl_from_port[ingress.key]
            to_port    = var.ingress_public_nacl_to_port[ingress.key]
            protocol   = var.ingress_public_nacl_protocol[ingress.key]
            cidr_block = var.ingress_public_nacl_cidr_block[ingress.key]
        }
    }

    dynamic "egress" {
        for_each = toset(range(length(var.egress_public_nacl_from_port)))
        content {
            rule_no    = var.egress_public_nacl_rule_no[egress.key]
            action     = var.egress_public_nacl_action[egress.key]
            from_port  = var.egress_public_nacl_from_port[egress.key]
            to_port    = var.egress_public_nacl_to_port[egress.key]
            protocol   = var.egress_public_nacl_protocol[egress.key]
            cidr_block = var.egress_public_nacl_cidr_block[egress.key]
        }
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

    dynamic "ingress" {
        for_each = toset(range(length(var.ingress_app_nacl_from_port)))
        content {
            rule_no    = var.ingress_app_nacl_rule_no[ingress.key]
            action     = var.ingress_app_nacl_action[ingress.key]
            from_port  = var.ingress_app_nacl_from_port[ingress.key]
            to_port    = var.ingress_app_nacl_to_port[ingress.key]
            protocol   = var.ingress_app_nacl_protocol[ingress.key]
            cidr_block = var.ingress_app_nacl_cidr_block[ingress.key]
        }
    }

    dynamic "egress" {
        for_each = toset(range(length(var.egress_app_nacl_from_port)))
        content {
            rule_no    = var.egress_app_nacl_rule_no[egress.key]
            action     = var.egress_app_nacl_action[egress.key]
            from_port  = var.egress_app_nacl_from_port[egress.key]
            to_port    = var.egress_app_nacl_to_port[egress.key]
            protocol   = var.egress_app_nacl_protocol[egress.key]
            cidr_block = var.egress_app_nacl_cidr_block[egress.key]
        }
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

    dynamic "ingress" {
        for_each = toset(range(length(var.ingress_db_nacl_from_port)))
        content {
            rule_no    = var.ingress_db_nacl_rule_no[ingress.key]
            action     = var.ingress_db_nacl_action[ingress.key]
            from_port  = var.ingress_db_nacl_from_port[ingress.key]
            to_port    = var.ingress_db_nacl_to_port[ingress.key]
            protocol   = var.ingress_db_nacl_protocol[ingress.key]
            cidr_block = var.ingress_db_nacl_cidr_block[ingress.key]
        }
    }

    dynamic "egress" {
        for_each = toset(range(length(var.egress_db_nacl_from_port)))
        content {
            rule_no    = var.egress_db_nacl_rule_no[egress.key]
            action     = var.egress_db_nacl_action[egress.key]
            from_port  = var.egress_db_nacl_from_port[egress.key]
            to_port    = var.egress_db_nacl_to_port[egress.key]
            protocol   = var.egress_db_nacl_protocol[egress.key]
            cidr_block = var.egress_db_nacl_cidr_block[egress.key]
        }
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

    dynamic "ingress" {
        for_each = toset(range(length(var.ingress_management_nacl_from_port)))
        content {
            rule_no    = var.ingress_management_nacl_rule_no[ingress.key]
            action     = var.ingress_management_nacl_action[ingress.key]
            from_port  = var.ingress_management_nacl_from_port[ingress.key]
            to_port    = var.ingress_management_nacl_to_port[ingress.key]
            protocol   = var.ingress_management_nacl_protocol[ingress.key]
            cidr_block = var.ingress_management_nacl_cidr_block[ingress.key]
        }
    }

    dynamic "egress" {
        for_each = toset(range(length(var.egress_management_nacl_from_port)))
        content {
            rule_no    = var.egress_management_nacl_rule_no[egress.key]
            action     = var.egress_management_nacl_action[egress.key]
            from_port  = var.egress_management_nacl_from_port[egress.key]
            to_port    = var.egress_management_nacl_to_port[egress.key]
            protocol   = var.egress_management_nacl_protocol[egress.key]
            cidr_block = var.egress_management_nacl_cidr_block[egress.key]
        }
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

    dynamic "ingress" {
        for_each = toset(range(length(var.ingress_platform_nacl_from_port)))
        content {
            rule_no    = var.ingress_platform_nacl_rule_no[ingress.key]
            action     = var.ingress_platform_nacl_action[ingress.key]
            from_port  = var.ingress_platform_nacl_from_port[ingress.key]
            to_port    = var.ingress_platform_nacl_to_port[ingress.key]
            protocol   = var.ingress_platform_nacl_protocol[ingress.key]
            cidr_block = var.ingress_platform_nacl_cidr_block[ingress.key]
        }
    }

    dynamic "egress" {
        for_each = toset(range(length(var.egress_platform_nacl_from_port)))
        content {
            rule_no    = var.egress_platform_nacl_rule_no[egress.key]
            action     = var.egress_platform_nacl_action[egress.key]
            from_port  = var.egress_platform_nacl_from_port[egress.key]
            to_port    = var.egress_platform_nacl_to_port[egress.key]
            protocol   = var.egress_platform_nacl_protocol[egress.key]
            cidr_block = var.egress_platform_nacl_cidr_block[egress.key]
        }
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
