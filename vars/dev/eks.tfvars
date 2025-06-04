region = "us-west-2"

cluster_name       = "terraform-eks-cluster-poc"
role_name          = "eks-cluster-role"
vpc_subnets        = ["subnet-00212fbe880719736", "subnet-007ab506046047319"]
node_group_name    = "terraform-eks-node-group"
node_instance_type = ["t3.medium"]
node_disk_size     = 20
policy_arns        = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
# eks_addons         = {
#     "coredns"                =  null #"v1.11.3-eksbuild.1"
#     "vpc-cni"                =  null #"v1.18.5-eksbuild.1"
#     "kube-proxy"             =  null #"v1.30.3-eksbuild.9"
#     "eks-pod-identity-agent" =  null #"v1.3.2-eksbuild.2"
#     "aws-ebs-csi-driver"     =  null #"v1.42.0-eksbuild.1"
#   }

# cluster_addons   = ["vpc-cni", "kube-proxy", "coredns"]

principal_arn      = "arn:aws:iam::533267438617:root"
kubernetes_groups  = ["group-1"]
access_policy_arn  = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
