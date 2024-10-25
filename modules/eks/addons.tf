resource "aws_eks_addon" "coredns" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "coredns"
  addon_version               = var.eks_addons["coredns"]
  resolve_conflicts_on_update = "PRESERVE"
}

resource "aws_iam_role" "vpc_cni_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  name               = "vpc-cni-role"
}

resource "aws_iam_role_policy_attachment" "vpc_cni_policy" {
  policy_arn = var.policy_arns[3]
  role       = aws_iam_role.vpc_cni_role.name
}

resource "aws_eks_addon" "vpc-cni" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "vpc-cni"
  addon_version               = var.eks_addons["vpc-cni"]
  resolve_conflicts_on_update = "PRESERVE"
  service_account_role_arn    = aws_iam_role.vpc_cni_role.arn
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "kube-proxy"
  addon_version               = var.eks_addons["kube-proxy"]
  resolve_conflicts_on_update = "PRESERVE"
}

resource "aws_eks_addon" "eks-pod-identity-agent" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "eks-pod-identity-agent"
  addon_version               = var.eks_addons["eks-pod-identity-agent"]
  resolve_conflicts_on_update = "PRESERVE"
}

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
    desired_size = 1
    max_size     = 2
    min_size     = 1
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

resource "aws_iam_role" "node-group-iam-role" {
  name = "eks-node-group-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = var.policy_arns[2]
  role       = aws_iam_role.node-group-iam-role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = var.policy_arns[3]
  role       = aws_iam_role.node-group-iam-role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = var.policy_arns[4]
  role       = aws_iam_role.node-group-iam-role.name
}

resource "aws_eks_access_entry" "access_entry" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  principal_arn     = var.principal_arn
  kubernetes_groups = var.kubernetes_groups
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "access_association" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  policy_arn    = var.access_policy_arn
  principal_arn = aws_eks_access_entry.access_entry.principal_arn

  access_scope {
    type = "cluster"
  }
}

