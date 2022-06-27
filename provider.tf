terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "dcube-terraform-state"
    # key    = "dev/vpc.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

