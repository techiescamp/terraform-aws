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
        "tag_key" = {
          "@@assign" = "Name"
        },
        "enforced_for" = {
          "@@assign" = [
            "ec2:instance",
            "ec2:security-group"
          ]
        }
      },
      "Environment" = {
        "tag_key" = {
          "@@assign" = "Environment"
        },
        "tag_value" = {
          "@@assign" = [
            "dev",
            "stage",
            "prod"
          ]
        },
        "enforced_for" = {
          "@@assign" = [
            "ec2:instance",
            "ec2:security-group"
          ]
        }
      },
      "Owner" = {
        "tag_key" = {
          "@@assign" = "Owner"
        },
        "tag_value" = {
          "@@assign" = [
            "Techiescamp"
          ]
        },
        "enforced_for" = {
          "@@assign" = [
            "ec2:instance",
            "ec2:security-group"
          ]
        }
      },
      "CostCenter" = {
        "tag_key" = {
          "@@assign" = "CostCenter"
        },
        "tag_value" = {
          "@@assign" = [
            "project-pet-clinic"
          ]
        },
        "enforced_for" = {
          "@@assign" = [
            "ec2:instance",
            "ec2:security-group"
          ]
        }
      },
      "Application" = {
        "tag_key" = {
          "@@assign" = "Application"
        },
        "tag_value" = {
          "@@assign" = [
            "web-app"
          ]
        },
        "enforced_for" = {
          "@@assign" = [
            "ec2:instance",
            "ec2:security-group"
          ]
        }
      }
    }
  })

  type = var.policy_type
}

resource "aws_organizations_policy_attachment" "account_attachment" {
  policy_id = aws_organizations_policy.tag_policy.id
  target_id = var.target_id
}




