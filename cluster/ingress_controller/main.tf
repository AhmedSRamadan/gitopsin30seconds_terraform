#helm repo add bitnami https://charts.bitnami.com/bitnami

data "helm_repository" "ingress_controller" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

