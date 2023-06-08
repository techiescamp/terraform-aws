provider "aws" {
  region = "us-west-2"
}

variable "cluster_name" {
  type    = string
  default = "eks-cluster"
}

variable "subnet_id_1" {
 type = string
 default = "subnet-058a7514ba8adbb07"
}

variable "ami_id" {
  type    = string
  default = "ami-0735c191cf914754d"
}
 
variable "subnet_id_2" {
 type = string
 default = "subnet-0dbcd1ac168414927"
}

variable "vpc_id" {
  type        = string
  default = "vpc-0a5ca4a92c2e10163"
}

variable "key-name" {
  type    = string
  default = "aswin-key"
}
