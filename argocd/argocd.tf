provider "helm" {
  kubernetes {
    config_path = "${path.root}/cluster/kubeconfig"
  }
}

data "helm_repository" "argo" {
  name = "argo"
  url  = "https://argoproj.github.io/argo-helm"
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = data.helm_repository.argo.metadata[0].name
  chart      = "argo-cd"
  version    = "2.0.3" # application version 1.4.2
  values = [
    file("${path.module}/argocd-values.yaml")
  ]
}