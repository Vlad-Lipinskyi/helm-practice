
output "database_host" {
  value = "127.0.0.1"
}

output "database_port" {
  value = var.db_port
}

output "database_name" {
  value = var.db_name
}

output "database_username" {
  value = var.db_user
}

output "database_connection" {
  value = "postgresql://${var.db_user}@127.0.0.1:${var.db_port}/${var.db_name}"
}
