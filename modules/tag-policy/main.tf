# Provider Configuration
provider "aws" {
  region = var.region
}

# Create Tag Policy
resource "aws_organizations_policy" "tag_policy" {
  name        = var.policy_name
  description = "Resource Provision"

  content = jsonencode({
    "tags" = {
      "Name" = {
        "tag_key"      = { "@@assign" = var.name_tag_key },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Environment" = {
        "tag_key"      = { "@@assign" = var.environment_tag_key },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Owner" = {
        "tag_key"      = { "@@assign" = var.owner_tag_key },
        "tag_value"    = { "@@assign" = var.owner_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "CostCenter" = {
        "tag_key"      = { "@@assign" = var.costcenter_tag_key },
        "tag_value"    = { "@@assign" = var.costcenter_tag_value },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      },
      "Application" = {
        "tag_key"      = { "@@assign" = var.application_tag_key },
        "enforced_for" = { "@@assign" = var.enforce_for_values }
      }
    }
  })

  type = var.policy_type
}

resource "aws_organizations_policy_attachment" "account_attachment" {
  policy_id = aws_organizations_policy.tag_policy.id
  target_id = var.target_id
}
