terraform {
  backend "gcs" {
    bucket  = "gitopsin30seconds_tfstate"
    prefix  = "terraform/state"
  }
}
