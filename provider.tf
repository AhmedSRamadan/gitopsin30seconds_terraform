provider "google" {
  credentials = file(var.gcloud_credentials_path)
  project     = "ahmedmohamed"
  region      = "us-central1"
}
