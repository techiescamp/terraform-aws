region = "us-west-2"

cluster_name       = "terraform-eks-cluster-poc"
role_name          = "eks-cluster-role"
vpc_subnets        = ["subnet-02ffe5c35f8b088b1", "subnet-0c424ee28097003e9"]
node_group_name    = "terraform-eks-node-group"
node_instance_type = ["t3.medium"]
node_disk_size     = 20
policy_arns        = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
eks_addons         = {
    "coredns"                = "v1.11.1-eksbuild.9"
    "vpc-cni"                = "v1.18.3-eksbuild.1"
    "kube-proxy"             = "v1.29.3-eksbuild.5"
    "eks-pod-identity-agent" = "v1.3.0-eksbuild.1"
  }
principal_arn      = "arn:aws:iam::533267438617:root"
kubernetes_groups  = ["group-1"]
access_policy_arn  = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
