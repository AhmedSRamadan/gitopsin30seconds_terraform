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
  project     = "gitopsin30seconds"
  region      = "us-central1"
}

module "k8s_cluster" {
  source          = "./cluster"
  cluster_name    = "gitops-in-30-seconds-gke"
  master_username = "admin"

  # passed via environment variable TF_VAR_master_password
  master_password = var.master_password
}
