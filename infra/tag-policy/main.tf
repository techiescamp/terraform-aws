provider "aws" {
  region = var.region
}

module "tag-policy" {
  source      = "../../../modules/tag-policy"
  region      = var.region
  policy_name = var.policy_name
  policy_type = var.policy_type
  target_id   = var.target_id

  name_tag_key         = var.name_tag_key
  environment_tag_key  = var.environment_tag_key
  owner_tag_key        = var.owner_tag_key
  owner_tag_value      = var.owner_tag_value
  costcenter_tag_key   = var.costcenter_tag_key
  costcenter_tag_value = var.costcenter_tag_value
  application_tag_key  = var.application_tag_key
  enforce_for_values   = var.enforce_for_values
}