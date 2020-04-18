output "kubeconfig_path" {
  value = local_file.kubeconfig.filename  # file path
}

output "cluster_domain" {
  value = google_container_cluster.primary.endpoint
}