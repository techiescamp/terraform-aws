provider "aws" {
  region = var.region
}

module "eks-cluster" {
  source             = "../../modules/eks"
  cluster_name       = var.cluster_name
  role_name          = var.role_name
  vpc_subnets        = var.vpc_subnets
  node_group_name    = var.node_group_name
  node_instance_type = var.node_instance_type
  node_disk_size     = var.node_disk_size
  policy_arns        = var.policy_arns
  eks_addons         = var.eks_addons
  principal_arn      = var.principal_arn
  kubernetes_groups  = var.kubernetes_groups
  access_policy_arn  = var.access_policy_arn
}