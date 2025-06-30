resource "aws_security_group" "eks_cluster" {
  name        = "${var.cluster_name}-eks-cluster-sg"
  description = "Security group for EKS cluster"
  vpc_id      = var.vpc_id

  // Allow all traffic within the security group (nodes <-> control plane)
  ingress {
    description      = "Allow all traffic within the security group"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    self             = true
  }

  // Allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    "karpenter.sh/discovery" = "${var.cluster_name}"
  }
}