variable "bucket_name" {
  default = "petclinic-statelock-bucket"
  description = "Name of the S3 bucket for Terraform state storage"
  type        = string
}

variable "table_name" {
  default = "petclinic-statelock-table"
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
}
