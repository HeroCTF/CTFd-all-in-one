resource "google_compute_firewall" "all_ports" {
  name    = "${var.network}-fw-all"
  network = google_compute_network.challs_network.name

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "icmp" {
  name    = "${var.network}-fw-icmp"
  network = google_compute_network.challs_network.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}