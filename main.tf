# remote backend
terraform {
  backend "gcs" {
    credentials = "terraform_account.json"
    bucket      = "gitopsin30seconds_terraformstate"
    prefix      = "terraform/state"
  }
}

# Google Cloud Provider
provider "google" {
  credentials = file("terraform_account.json")
  project = "gitopsin30seconds"
  region  = "us-central1"
}

module "k8s_cluster" {
  source = "./cluster"
  cluster_name = "gitops-in-30-seconds-gke"
}

module "argocd" {
  source = "./argocd"
  kubeconfig_path = module.k8s_cluster.kubeconfig_path
  argocd_server = module.k8s_cluster.cluster_domain
}
