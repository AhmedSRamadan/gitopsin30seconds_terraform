data "helm_repository" "ingress_controller" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

data "template_file" "nginx-ingress-controller-values" {
  template = file("${path.module}/nginx-ingress-controller-values.yaml")
}

resource "helm_release" "nginx_ingress_controller" {
  name       = "nginx-ingress"
  repository = data.helm_repository.ingress_controller.metadata[0].name
  chart      = "nginx-ingress"
  version    = "1.36.3" # application version 0.30.0
  //  values = [
  //    data.template_file.nginx-ingress-controller-values.rendered
  //  ]
  //  timeout = 600 # in seconds
}