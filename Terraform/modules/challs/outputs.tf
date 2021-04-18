output "public-ip" {
  value = google_compute_address.public_ip_address.address
}