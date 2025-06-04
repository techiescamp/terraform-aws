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

# IAM Role for Node Group
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
  policy_arn = var.policy_arns[5]
  role       = aws_iam_role.node-group-iam-role.name
}