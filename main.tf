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