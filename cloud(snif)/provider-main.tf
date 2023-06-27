terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.70.0"
    }
  }
}
provider "google" {
  # Configuration options
  credentials = file(var.gcp_auth_file)
  region  = var.gcp_region
  zone    = var.gcp_zone
  project = var.gcp_project
}