terraform {
  backend "gcs" {
    credentials = "terraform_account.json"
    bucket  = "gitopsin30seconds_tfstate"
    prefix  = "terraform/state"
  }
}
