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