resource "google_compute_network" "heroctf_network" {
  name = var.network
}

resource "google_compute_subnetwork" "heroctf_network_subnetwork" {
  name          = "${var.network}-subnetwork-${var.subnetwork_region}"
  region        = var.subnetwork_region
  network       = google_compute_network.heroctf_network.self_link
  ip_cidr_range = "10.0.0.0/16"
}