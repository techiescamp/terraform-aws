provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "my_table" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform State Lock Table"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}



