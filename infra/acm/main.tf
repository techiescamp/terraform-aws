provider "aws" {
  region = var.region
}

module "acm" {
  source = "../../modules/acm"
  region = var.region

  domain_name                                 = var.domain_name
  validation_method                           = var.validation_method
  key_algorithm                               = var.key_algorithm
  certificate_transparency_logging_preference = var.certificate_transparency_logging_preference
  dns_domain_name = var.dns_domain_name
  
  name        = var.name
  environment = var.environment
  owner       = var.owner
  cost_center = var.cost_center
  application = var.application
}  