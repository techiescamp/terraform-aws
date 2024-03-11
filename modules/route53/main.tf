resource "aws_route53_zone" "dns_zone" {
  name = var.dns_domain_name

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-hosted-zone"
      Environment = var.environment
      Owner       = var.owner
      CostCenter  = var.cost_center
      Application = var.application
    },
    var.tags
  )
}
