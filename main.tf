terraform {
  required_version = ">= 1.5.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }
}

provider "helm" {
  kubernetes = {
    config_path    = pathexpand("~/.kube/config")
    config_context = "kind-devops-cluster"
  }
}

module "jenkins" {
  source = "./modules/jenkins"

  kubeconfig   = pathexpand("~/.kube/config")
  cluster_name = "devops-cluster"
}

module "argo_cd" {
  source = "./modules/argo_cd"
}