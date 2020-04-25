resource "helm_release" "cluster_config" {
  name    = "k8s-config" # make sure name follows helm chart name rules
  chart   = "./${path.module}/k8s_config"
  timeout = 600 # workaround
}

output "cluster_config_staus" {
  value = helm_release.cluster_config.status
}