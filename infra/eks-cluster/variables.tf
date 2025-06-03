variable "region" {
  type        = string
  description = "Region of the EC2 instance"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role for EKS"
  type        = string
}

variable "vpc_subnets" {
  description = "List of VPC subnet IDs"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name of the node group"
  type        = string
}

variable "node_instance_type" {
  description = "EC2 instance type for the node group"
  type        = list(string)
}

variable "node_disk_size" {
  description = "Disk size for the node group instances"
  type        = number
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach to the roles"
  type        = list(string)
}

# variable "eks_addons" {
#   description = "List of EKS addons and their versions"
#   type = map(string)
# }

variable "principal_arn" {
  description = "The ARN of the principal"
  type        = string
}

variable "kubernetes_groups" {
  description = "Kubernetes groups"
  type        = list(string)
}

variable "access_policy_arn" {
  description = "The ARN of the access policy"
  type        = string
}



# addons
# variable "cluster_addons" {
#   description = "List of addon names to install (use most recent version)"
#   type        = list(string)
# }



# Karpenter

variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# variable "cluster_name" {
#   description = "The name of the EKS cluster"
#   type        = string
# }

variable "create_iam_role" {
  description = "Determines whether an IAM role is created"
  type        = bool
}

variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "iam_role_use_name_prefix" {
  description = "Determines whether the name of the IAM role (`iam_role_name`) is used as a prefix"
  type        = bool
}

variable "iam_role_path" {
  description = "Path of the IAM role"
  type        = string
}

variable "iam_role_description" {
  description = "IAM role description"
  type        = string
}

variable "iam_role_max_session_duration" {
  description = "Maximum API session duration in seconds between 3600 and 43200"
  type        = number
}

variable "iam_role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for the IAM role"
  type        = string
}

variable "iam_role_tags" {
  description = "A map of additional tags to add the the IAM role"
  type        = map(any)
}

variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "iam_policy_use_name_prefix" {
  description = "Determines whether the name of the IAM policy (`iam_policy_name`) is used as a prefix"
  type        = bool
}

variable "iam_policy_path" {
  description = "Path of the IAM policy"
  type        = string
}

variable "iam_policy_description" {
  description = "IAM policy description"
  type        = string
}

variable "iam_policy_statements" {
  description = "A list of IAM policy statements"
  type        = any
}

variable "iam_role_policies" {
  description = "Policies to attach to the IAM role in `{'static_name' = 'policy_arn'}` format"
  type        = map(string)
}

variable "ami_id_ssm_parameter_arns" {
  description = "List of SSM Parameter ARNs that Karpenter controller is allowed read access (for retrieving AMI IDs)"
  type        = list(string)
}

variable "enable_pod_identity" {
  description = "Determines whether to enable support for EKS pod identity"
  type        = bool
}

variable "enable_v1_permissions" {
  description = "Determines whether to enable permissions suitable for v1+ or v0.33.x-v0.37.x"
  type        = bool
}

variable "enable_irsa" {
  description = "Determines whether to enable support for IAM role for service accounts"
  type        = bool
}

variable "irsa_oidc_provider_arn" {
  description = "OIDC provider arn used in trust policy for IAM role for service accounts"
  type        = string
}

variable "irsa_namespace_service_accounts" {
  description = "List of `namespace:serviceaccount` pairs for IAM trust policy"
  type        = list(string)
}

variable "irsa_assume_role_condition_test" {
  description = "IAM condition operator used in role assumption"
  type        = string
}

variable "create_pod_identity_association" {
  description = "Determines whether to create pod identity association"
  type        = bool
}

variable "namespace" {
  description = "Namespace to associate with the Karpenter Pod Identity"
  type        = string
}

variable "service_account" {
  description = "Service account to associate with the Karpenter Pod Identity"
  type        = string
}

variable "enable_spot_termination" {
  description = "Determines whether to enable native spot termination handling"
  type        = bool
}

variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "queue_managed_sse_enabled" {
  description = "Enable server-side encryption with SQS-owned encryption keys"
  type        = bool
}

variable "queue_kms_master_key_id" {
  description = "KMS CMK ID for SQS encryption"
  type        = string
}

variable "queue_kms_data_key_reuse_period_seconds" {
  description = "SQS KMS data key reuse period in seconds"
  type        = number
}

variable "create_node_iam_role" {
  description = "Determines whether a node IAM role is created"
  type        = bool
}

variable "cluster_ip_family" {
  description = "IP family used (ipv4 or ipv6)"
  type        = string
}

variable "node_iam_role_arn" {
  description = "Existing IAM role ARN to use for instance profile"
  type        = string
}

variable "node_iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
}

variable "node_iam_role_use_name_prefix" {
  description = "Use IAM role name as prefix"
  type        = bool
}

variable "node_iam_role_path" {
  description = "IAM role path"
  type        = string
}

variable "node_iam_role_description" {
  description = "Description of the node IAM role"
  type        = string
}

variable "node_iam_role_max_session_duration" {
  description = "Max API session duration for node role"
  type        = number
}

variable "node_iam_role_permissions_boundary" {
  description = "IAM permissions boundary ARN for node role"
  type        = string
}

variable "node_iam_role_attach_cni_policy" {
  description = "Attach AmazonEKS_CNI_Policy to IAM role"
  type        = bool
}

variable "node_iam_role_additional_policies" {
  description = "Additional IAM policies for node role"
  type        = map(string)
}

variable "node_iam_role_tags" {
  description = "Additional tags for node IAM role"
  type        = map(string)
}

variable "create_access_entry" {
  description = "Determines whether an access entry is created"
  type        = bool
}

variable "access_entry_type" {
  description = "Type of access entry (EC2_LINUX, FARGATE_LINUX, EC2_WINDOWS)"
  type        = string
}

variable "create_instance_profile" {
  description = "Whether to create an IAM instance profile"
  type        = bool
}

variable "rule_name_prefix" {
  description = "Prefix used for all event bridge rules"
  type        = string
}
