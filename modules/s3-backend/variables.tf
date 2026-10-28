# Описує вхідні параметри модуля: наприклад, назву S3 bucket, регіон AWS або назву DynamoDB-таблиці.

variable "bucket_name" {
  description = "Globally unique bucket name for Terraform state."
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for state locking."
  type        = string
}
