resource "aws_iam_openid_connect_provider" "eks_oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.tls_cert.certificates[0].sha1_fingerprint]
  url             = data.tls_certificate.tls_cert.url
}

data "tls_certificate" "tls_cert" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
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