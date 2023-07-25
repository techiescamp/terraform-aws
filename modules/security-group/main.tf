resource "aws_security_group" "instance_sg" {
  name        = "${var.environment}-${var.application}-sg"
  description = "Security Group for Instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = toset(range(length(var.ingress_from_port)))
    content {
      from_port   = var.ingress_from_port[ingress.key]
      to_port     = var.ingress_to_port[ingress.key]
      protocol    = var.ingress_protocol[ingress.key]
      cidr_blocks = var.ingress_cidr_block
    }
  }

  dynamic "egress" {
    for_each = toset(range(length(var.egress_from_port)))
    content {
      from_port   = var.egress_from_port[egress.key]
      to_port     = var.egress_to_port[egress.key]
      protocol    = var.egress_protocol[egress.key]
      cidr_blocks = var.egress_cidr_block
    }
  }

  tags = merge(
    {
      "Name"        = "${var.environment}-${var.application}-sg"
      "Environment" = var.environment
      "Owner"       = var.owner
      "CostCenter"  = var.cost_center
      "Application" = var.application
    },
    var.tags
  )

}