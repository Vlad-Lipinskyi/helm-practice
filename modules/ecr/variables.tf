# Описує вхідні параметри модуля: наприклад, назву репозиторію, регіон AWS або налаштування тегів.

variable "repository_name" { type = string }
variable "scan_on_push" {
  type    = bool
  default = true
}
