# Повертає результати створення ресурсів, наприклад URL ECR-репозиторію. Цей URL можна використати для завантаження образу та налаштування Deployment у Kubernetes.

variable "repository_name" { type = string }
variable "scan_on_push" {
  type    = bool
  default = true
}
