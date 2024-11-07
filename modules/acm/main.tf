resource "aws_acm_certificate" "ssl_cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
  key_algorithm     = var.key_algorithm

  lifecycle {
    create_before_destroy = true
  }

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference
  }

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-SSL-Cert"
      Environment = var.environment
      Owner       = var.owner
      CostCenter  = var.cost_center
      Application = var.application
    },
    var.tags
  )
}

data "aws_route53_zone" "dns_zone" {
  name         = var.dns_domain_name
  private_zone = false
}

resource "aws_route53_record" "acm_record" {
  for_each = {
    for dvo in aws_acm_certificate.ssl_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = data.aws_route53_zone.dns_zone.zone_id 
}
