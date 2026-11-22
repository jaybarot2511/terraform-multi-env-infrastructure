variable "aws_region" {
  type        = string
  description = "Aws region for state bucket and lock table"
  default     = "ap-south-1"
}

variable "bucket_name" {
  type        = string
  description = "Globally unique S3 bucket name for Terraform state"
  default     = "jay-tfstate-multi-env-2026"

}

variable "dynamodb_table_name" {
  type        = string
  description = "DynamoDB table name for Terraform state locking"
  default     = "terraform-state-locks"

}
