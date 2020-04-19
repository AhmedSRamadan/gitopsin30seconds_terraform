data "helm_repository" "argo" {
  name = "argo"
  url  = "https://argoproj.github.io/argo-helm"
}

data "template_file" "argocd-values" {
  template = file("${path.module}/argocd-values-template.yaml")

  vars = {
    argocd_server = var.argocd_server
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = data.helm_repository.argo.metadata[0].name
  chart      = "argo-cd"
  version    = "2.0.3" # application version 1.4.2
  namespace  = "argocd"
  values = [
    data.template_file.argocd-values.rendered
  ]
}

output "helm_release_argocd_chart_status" {
  value = helm_release.argocd.status
}