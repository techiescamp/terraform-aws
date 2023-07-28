# Tag Policy Vars
region      = "eu-north-1"
policy_name = "Techiescamp"
policy_type = "TAG_POLICY"
target_id   = "814200988517"

name_tag_key            = "Name"
name_enforce_for_values = ["ec2:instance", "ec2:security-group"]

environment_tag_key            = "Environment"
environment_enforce_for_values = ["ec2:instance", "ec2:security-group"]

owner_tag_key            = "Owner"
owner_tag_value          = ["techiescamp"]
owner_enforce_for_values = ["ec2:instance", "ec2:security-group"]

costcenter_tag_key            = "CostCenter"
costcenter_tag_value          = ["techiescamp-commerce"]
costcenter_enforce_for_values = ["ec2:instance", "ec2:security-group"]

application_tag_key            = "Application"
application_enforce_for_values = ["ec2:instance", "ec2:security-group"]


