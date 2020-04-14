provider "helm" {
  kubernetes {
    config_path = "/path/to/kube_cluster.yaml"
  }
}

data "helm_repository" "argo" {
  name = "argo"
  url  = "https://argoproj.github.io/argo-helm"
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = data.helm_repository.argo.metadata[0].name
  chart      = "argocd"
  version    = "2.0.3" # application version 1.4.2

  values = [
    "${file("argocd-values.yaml")}"
  ]
}