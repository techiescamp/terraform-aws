# General
create       = true
tags         = {}
cluster_name = "terraform-eks-cluster-poc"

# Karpenter controller IAM Role
create_iam_role                   = true
iam_role_name                     = "KarpenterController"
iam_role_use_name_prefix          = true
iam_role_path                     = "/"
iam_role_description              = "Karpenter controller IAM role"
iam_role_max_session_duration     = null
iam_role_permissions_boundary_arn = null
iam_role_tags                     = {}
iam_policy_name                   = "KarpenterController"
iam_policy_use_name_prefix        = true
iam_policy_path                   = "/"
iam_policy_description            = "Karpenter controller IAM policy"
iam_policy_statements             = []
iam_role_policies                 = {}
ami_id_ssm_parameter_arns         = []
enable_pod_identity               = true
enable_v1_permissions             = true

# IRSA (IAM Role for Service Account)
enable_irsa                     = false
irsa_oidc_provider_arn          = ""
irsa_namespace_service_accounts = ["kube-system:karpenter"]
irsa_assume_role_condition_test = "StringEquals"

# Pod Identity Association
create_pod_identity_association = true
namespace                       = "kube-system"
service_account                 = "karpenter"

# Node Termination Queue
enable_spot_termination                 = true
queue_name                              = null
queue_managed_sse_enabled               = true
queue_kms_master_key_id                 = null
queue_kms_data_key_reuse_period_seconds = null

# Node IAM Role
create_node_iam_role               = true
cluster_ip_family                  = "ipv4"
node_iam_role_arn                  = null
node_iam_role_name                 = null
node_iam_role_use_name_prefix      = true
node_iam_role_path                 = "/"
node_iam_role_description          = null
node_iam_role_max_session_duration = null
node_iam_role_permissions_boundary = null
node_iam_role_attach_cni_policy    = true
node_iam_role_additional_policies  = {}
node_iam_role_tags                 = {}

# Access Entry
create_access_entry = true
access_entry_type   = "EC2_LINUX"

# IAM Instance Profile
create_instance_profile = true

# EventBridge Rules
rule_name_prefix = "Karpenter"
