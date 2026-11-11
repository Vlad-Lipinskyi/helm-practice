terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.0.0"
    }
  }
}

provider "helm" {
  kubernetes = {
    config_path    = pathexpand("~/.kube/config")
    config_context = "docker-desktop"
  }
}

module "argo_cd" {
  source = "./modules/argo_cd"

  name          = "argo-cd"
  namespace     = "argocd"
  chart_version = "5.46.4"
}

module "rds" {

  source = "./modules/rds"


  name                       = "myapp-db"

  use_aurora                 = false

  aurora_instance_count      = 2


  # --- RDS-only ---

  engine                     = "postgres"

  engine_version             = "17.2"

  parameter_group_family_rds = "postgres17"


  # Common

  instance_class             = "db.t3.medium"

  allocated_storage          = 20

  db_name                    = "myapp"

  username                   = "postgres"

  password                   = "admin123AWS23"

  subnet_private_ids         = module.vpc.private_subnets

  subnet_public_ids          = module.vpc.public_subnets

  publicly_accessible        = true

  vpc_id                     = module.vpc.vpc_id

  multi_az                   = true

  backup_retention_period    = 7

  parameters = {

    max_connections              = "200"

    log_min_duration_statement   = "500"

  }


  tags = {

    Environment = "dev"

    Project     = "myapp"

  }

} 

module "rds" {

  source = "./modules/rds"


  name                       = "myapp-db"

  use_aurora                 = true

  aurora_instance_count      = 2


  # --- Aurora-only ---

  engine_cluster             = "aurora-postgresql"

  engine_version_cluster     = "15.3"

  parameter_group_family_aurora = "aurora-postgresql15"

  


  # --- RDS-only ---

  engine                     = "postgres"

  engine_version             = "17.2"

  parameter_group_family_rds = "postgres17"


  # Common

  instance_class             = "db.t3.medium"

  allocated_storage          = 20

  db_name                    = "myapp"

  username                   = "postgres"

  password                   = "admin123AWS23"

  subnet_private_ids         = module.vpc.private_subnets

  subnet_public_ids          = module.vpc.public_subnets

  publicly_accessible        = true

  vpc_id                     = module.vpc.vpc_id

  multi_az                   = true

  backup_retention_period    = 7

  parameters = {

    max_connections              = "200"

    log_min_duration_statement   = "500"

  }


  tags = {

    Environment = "dev"

    Project     = "myapp"

  }

}