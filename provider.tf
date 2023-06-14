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
    region         = "us-west-2"
    dynamodb_table = aws_dynamodb_table.state_lock.name
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "state_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}