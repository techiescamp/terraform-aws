variable "region" {
  type        = string
  description = "Region of the EC2 instance"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role for EKS"
  type        = string
}

variable "vpc_subnets" {
  description = "List of VPC subnet IDs"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name of the node group"
  type        = string
}

variable "node_instance_type" {
  description = "EC2 instance type for the node group"
  type        = list(string)
}

variable "node_disk_size" {
  description = "Disk size for the node group instances"
  type        = number
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach to the roles"
  type        = list(string)
}

variable "eks_addons" {
  description = "List of EKS addons and their versions"
  type = map(string)
}

variable "principal_arn" {
  description = "The ARN of the principal"
  type        = string
}

variable "kubernetes_groups" {
  description = "Kubernetes groups"
  type        = list(string)
}

variable "access_policy_arn" {
  description = "The ARN of the access policy"
  type        = string
}
