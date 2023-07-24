provider "aws" {
  region = var.region
}

module "tag-policy" {
  source      = "../../../modules/tag-policy"
  region      = var.region
  policy_name = var.policy_name
  policy_type = var.policy_type
  target_id   = var.target_id
}