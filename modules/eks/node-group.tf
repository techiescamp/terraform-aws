# EKS Node Group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.node_group_name
  version         = aws_eks_cluster.eks_cluster.version
  node_role_arn   = aws_iam_role.node-group-iam-role.arn
  subnet_ids      = var.vpc_subnets
  capacity_type   = "ON_DEMAND"
  disk_size       = var.node_disk_size
  instance_types  = var.node_instance_type

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}

