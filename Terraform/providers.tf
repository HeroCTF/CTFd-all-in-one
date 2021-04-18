provider "google" {
  credentials = file("credentials/cloud_credentials.json")

  project = var.project

  region = var.region
  zone   = var.zone
}