resource "google_compute_instance" "challs" {
  name         = "${var.challs_instance_name}-${count.index}"
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
    subnetwork = google_compute_subnetwork.challs_network_subnetwork.name
    access_config {}
  }
}

resource "google_compute_instance" "box" {
  name         = "${var.box_instance_name}-${count.index}"
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
    subnetwork = google_compute_subnetwork.challs_network_subnetwork.name
    access_config {}
  }
}

resource "google_compute_instance" "ctfd" {
  name         = "${var.ctfd_instance_name}-${count.index}"
  machine_type = var.box_instance_type
  count        = var.box_count
  zone         = var.zone

  boot_disk {
    initialize_params {
      image     = var.image
      size      = var.disk_size
      disk_type = "local-ssd"
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.challs_network_subnetwork.name
    access_config {}
  }
}



resource "google_compute_address" "public_ip_address" {
  name = "public-ip"
}
