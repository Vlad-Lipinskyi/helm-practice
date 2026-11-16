
variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "myapp"
}

variable "db_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Local PostgreSQL port"
  type        = number
  default     = 5432
}
