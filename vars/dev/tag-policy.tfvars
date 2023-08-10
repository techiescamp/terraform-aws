# Tag Policy Vars
region      = "eu-north-1"
policy_name = "Techiescamp"
policy_type = "TAG_POLICY"
target_id   = "814200988517"

name_tag_key         = "Name"
environment_tag_key  = "Environment"
owner_tag_key        = "Owner"
owner_tag_value      = ["techiescamp"]
costcenter_tag_key   = "CostCenter"
costcenter_tag_value = ["techiescamp-commerce"]
application_tag_key  = "Application"
enforce_for_values   = ["dynamodb:*", "ec2:dhcp-options", "ec2:elastic-ip", "ec2:fpga-image", "ec2:instance",
                        "ec2:internet-gateway", "ec2:launch-template", "ec2:natgateway", "ec2:network-acl",
                        "ec2:network-interface", "ec2:route-table", "ec2:security-group", "ec2:snapshot",
                        "ec2:subnet", "ec2:volume", "ec2:vpc", "ec2:vpc-endpoint", "ec2:vpc-endpoint-service",
                        "ec2:vpc-peering-connection", "ec2:vpn-connection", "ec2:vpn-gateway", "elasticfilesystem:*",
                        "elasticloadbalancing:*", "iam:instance-profile", "iam:mfa", "iam:policy", "kms:*",
                        "lambda:*", "rds:cluster-pg", "rds:cluster-endpoint", "rds:es", "rds:og", "rds:pg", "rds:db-proxy",
                        "rds:db-proxy-endpoint", "rds:ri", "rds:secgrp", "rds:subgrp", "rds:target-group", "resource-groups:*",
                        "route53:hostedzone", "s3:bucket", "s3:bucket"]


