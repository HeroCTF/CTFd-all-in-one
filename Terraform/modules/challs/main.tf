resource "google_compute_instance" "challs" {
  name         = var.challs_instance_name
  machine_type = var.challs_instance_type
  count        = var.challs_count
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }

  network_interface {
    subnetwork = var.subnetwork_name
    access_config {}
  }
}

resource "google_compute_instance" "box" {
  name         = var.box_instance_name
  machine_type = var.box_instance_type
  count        = var.box_count
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }

  network_interface {
    subnetwork = var.subnetwork_name
    access_config {}
  }
}

resource "google_compute_address" "public_ip_address" {
  name = "public-ip"
}
