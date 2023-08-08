variable "bucket_name" {
  default = "testy2137237-bucket"
  description = "Name of the S3 bucket for Terraform state storage"
  type        = string
}

variable "table_name" {
  default = "test-table"
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
}

variable "key" {
  default = "test/statefile.tfstate"
  description = "Path of the state file"
  type        = string
}