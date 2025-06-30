region = "us-west-2"

cluster_name       = "terraform-eks-cluster-poc"
role_name          = "eks-cluster-role"
vpc_subnets        = ["subnet-00212fbe880719736", "subnet-007ab506046047319"]
node_group_name    = "terraform-eks-node-group"
node_instance_type = ["t3.medium"]
node_disk_size     = 20
policy_arns = [
  "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
  "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
]

principal_arn     = "arn:aws:iam::123456789:root"
kubernetes_groups = ["group-1"]
access_policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"

# Security group variables
vpc_id = "vpc-099dd3481417d3fe8"