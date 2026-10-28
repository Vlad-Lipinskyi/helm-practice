# об'єднує модулі та описує, яку інфраструктуру потрібно створити.

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
}

module "ecr" {
  source = "./modules/ecr"
}

module "eks" {
  source = "./modules/eks"

  cluster_name = "django-cluster"
  subnet_ids   = module.vpc.private_subnet_ids
}