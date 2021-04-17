provider "google" {
  credentials = file("cloud_credentials.json")

  project = var.project

  region = var.region
  zone   = var.zone
}