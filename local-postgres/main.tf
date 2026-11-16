
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {}

# PostgreSQL Docker image
resource "docker_image" "postgres" {
  name         = "postgres:17"
  keep_locally = true
}

# Persistent storage for database
resource "docker_volume" "postgres_data" {
  name = "myapp-postgres-data"
}

# PostgreSQL container
resource "docker_container" "postgres" {
  name  = "local-postgres"
  image = docker_image.postgres.image_id

  restart = "unless-stopped"

  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}"
  ]

  ports {
    internal = 5432
    external = var.db_port
    ip       = "127.0.0.1"
  }

  mounts {
    type   = "volume"
    source = docker_volume.postgres_data.name
    target = "/var/lib/postgresql/data"
  }
}
