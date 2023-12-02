provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "state_lock_bucket" {
  bucket = "${var.environment}-${var.application}-s3-bucket"

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-s3-bucket"
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_dynamodb_table" "state_lock_table" {
  name           = "${var.environment}-${var.application}-dynamodb-table"
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key

  attribute {
    name = var.attribute_name
    type = var.attribute_type
  }

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-dynamodb-table"
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}