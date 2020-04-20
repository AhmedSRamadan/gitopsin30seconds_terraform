#helm repo add bitnami https://charts.bitnami.com/bitnami

data "helm_repository" "ingress_controller" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

resource "helm_release" "nginx_ingress_controller" {
  name       = "nginx-ingress-controller"
  repository = data.helm_repository.ingress_controller.metadata[0].name
  chart      = "nginx-ingress-controller"
  version    = "5.3.16" # application version 0.30.0
}