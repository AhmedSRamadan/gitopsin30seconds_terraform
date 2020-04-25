//resource "helm_release" "cluster_config" {
//  name    = "k8s-config" # make sure name follows helm chart name rules
//  chart   = "./${path.module}/k8s_config"
//  timeout = 500 # workaround
//}
//
//output "cluster_config_staus" {
//  value = helm_release.cluster_config.status
//}

variable "cluster_node_pool_id" {
  type = string
}

resource "null_resource" "cluster_bootstrap" {
  triggers = {
    cluster_config_tf_changes = sha256(file("${path.module}/cluster_config.tf"))
    argocd_app_changes = sha256(file("${path.module}/argocd/argocd-application.yaml"))
    argocd_clusterrole_changes = sha256(file("${path.module}/argocd/argocd-cluster-role-binding.yaml"))
    argocd_namespace_changes = sha256(file("${path.module}/argocd/argocd_namespace.yaml"))
  }

  provisioner "local-exec" {
    command = <<EOH
    cd "${path.module}"
kubectl apply -f argocd/argocd_namespace.yaml --kubeconfig ../kubeconfig
sleep 10
kubectl apply -n argocd -f argocd/argocd-cluster-role-binding.yaml --kubeconfig ../kubeconfig
sleep 10
kubectl apply -n argocd -f argocd/argocd-application.yaml --kubeconfig ../kubeconfig
sleep 10
  EOH
  }
//  command = <<EOH
//    cd "${path.module}"
//echo "$KUBE_CONFIG_RENDERED" > kube_config.yaml
//kubectl apply -f argocd/argocd_namespace.yaml --kubeconfig kube_config.yaml
//sleep 10
//kubectl apply -n argocd -f argocd/argocd-cluster-role-binding.yaml --kubeconfig kube_config.yaml
//sleep 10
//kubectl apply -n argocd -f argocd/argocd-application.yaml --kubeconfig kube_config.yaml
//sleep 10
//  EOH
//}

}

output "cluster_config_staus" {
  value = null_resource.cluster_bootstrap.id
}