provider "google" {
  credentials = file("terraform_account.json")
  project = "gitopsin30seconds"
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    credentials = "terraform_account.json"
    bucket      = "gitopsin30seconds_tfstate"
    prefix      = "terraform/state"
  }
}

module "k8s_cluster" {
  source = "./cluster"
  cluster_name = "gitops-in-30-seconds-gke"
}

module "argocd" {
  source = "./argocd"
}