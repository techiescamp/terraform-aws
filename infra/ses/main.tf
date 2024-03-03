provider "aws" {
  region = var.region
}

module "ses" {
  source            = "../../modules/ses"
  region            = var.region
  domain_name       = var.domain_name
  dkim_record_count = var.dkim_record_count
  zone_id           = var.zone_id
  dkim_record_type  = var.dkim_record_type
  dkim_ttl          = var.dkim_ttl
  custom_mail       = var.custom_mail
  spf_mx_record     = var.spf_mx_record
  spf_txt_record    = var.spf_txt_record
  spf_ttl           = var.spf_ttl
  name              = var.name
  environment       = var.environment
  owner             = var.owner
  cost_center       = var.cost_center
  application       = var.application
}


