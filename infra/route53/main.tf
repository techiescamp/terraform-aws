provider "aws" {
  region = var.region
}

module "route53" {
  source = "../../modules/route53"
  region = var.region

  dns_domain_name = var.dns_domain_name

  name        = var.name
  environment = var.environment
  owner       = var.owner
  cost_center = var.cost_center
  application = var.application

}  