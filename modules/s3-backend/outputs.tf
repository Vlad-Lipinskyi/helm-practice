# Повертає значення створених ресурсів, наприклад назву bucket або таблиці, щоб їх можна було використовувати в інших частинах конфігурації.

output "bucket_name" {
  description = "Terraform state bucket name."
  value       = aws_s3_bucket.state.bucket
}

output "dynamodb_table_name" {
  description = "Terraform state lock table name."
  value       = aws_dynamodb_table.locks.name
}
