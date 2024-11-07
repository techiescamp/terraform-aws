output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  description = "The certificate authority data for the cluster"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.arn
}

output "oidc_provider_arn" {
  description = "The ARN of the OIDC provider"
  value       = aws_iam_openid_connect_provider.eks_oidc_provider.arn
}

output "node_group_name" {
  description = "The name of the EKS node group"
  value       = aws_eks_node_group.node_group.node_group_name
}

output "node_group_instance_types" {
  description = "The instance types used in the EKS node group"
  value       = aws_eks_node_group.node_group.instance_types
}

output "node_group_disk_size" {
  description = "The disk size for the EKS node group instances"
  value       = aws_eks_node_group.node_group.disk_size
}

output "iam_role_name" {
  description = "The name of the IAM role used for the EKS cluster"
  value       = aws_iam_role.cluster_role.name
}

output "vpc_subnets" {
  description = "The VPC subnets used by the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].subnet_ids
}

output "coredns_addon_version" {
  description = "The version of the CoreDNS addon"
  value       = aws_eks_addon.coredns.addon_version
}

output "vpc_cni_addon_version" {
  description = "The version of the VPC CNI addon"
  value       = aws_eks_addon.vpc-cni.addon_version
}

output "kube_proxy_addon_version" {
  description = "The version of the kube-proxy addon"
  value       = aws_eks_addon.kube-proxy.addon_version
}

output "eks_pod_identity_agent_addon_version" {
  description = "The version of the EKS Pod Identity Agent addon"
  value       = aws_eks_addon.eks-pod-identity-agent.addon_version
}

output "access_entry_principal_arn" {
  description = "The ARN of the principal for the access entry"
  value       = aws_eks_access_entry.access_entry.principal_arn
}

output "access_policy_arn" {
  description = "The ARN of the access policy associated with the EKS cluster"
  value       = aws_eks_access_policy_association.access_association.policy_arn
}
