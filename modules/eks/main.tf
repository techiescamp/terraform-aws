resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids               = var.vpc_subnets
    endpoint_private_access  = true
    endpoint_public_access   = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "cluster_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = var.policy_arns[0]
  role       = aws_iam_role.cluster_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
  policy_arn = var.policy_arns[1]
  role       = aws_iam_role.cluster_role.name
}

data "tls_certificate" "tls_cert" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks_oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.tls_cert.certificates[0].sha1_fingerprint]
  url             = data.tls_certificate.tls_cert.url
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_oidc_provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-node"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks_oidc_provider.arn]
      type        = "Federated"
    }
  }
}

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

