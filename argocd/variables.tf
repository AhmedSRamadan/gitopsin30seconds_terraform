variable "kubeconfig_path" {
  description = "the path to kubeconfig file created by cluster module"
  type = string
}

variable "argocd_server" {
  description = "the host where argocd server will run"
  type = string
}