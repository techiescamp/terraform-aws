resource "aws_security_group" "instance_sg" {
  name        = var.sg_name
  description = "Security Group for Instance"

  dynamic "ingress" {
    for_each = toset(range(length(var.from_port)))
    content {
      from_port   = var.from_port[ingress.key]
      to_port     = var.to_port[ingress.key]
      protocol    = var.protocol[ingress.key]
      cidr_blocks = var.cidr_block
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      "Name"        = "${var.name}-sg"
      "Environment" = var.environment[0]
      "Owner"       = var.owner
      "CostCenter"  = var.cost_center
      "Application" = var.application
    },
    var.tags
  )

}