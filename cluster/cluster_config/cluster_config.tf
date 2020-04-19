resource "helm_release" "cluster_config" {
  name  = "k8s_config"
  chart = "./k8s_config"
}

output "cluster_config_staus" {
  value = helm_release.cluster_config.status
}