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