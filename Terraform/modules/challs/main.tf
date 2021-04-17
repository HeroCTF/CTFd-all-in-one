resource "random_id" "instance_id" {
    byte_length = 8
}

resource "google_compute_instance" "challs" {
    name         = "${var.name}-${random_id.instance_id.hex}"
    machine_type = var.instance_type
    zone         = var.zone

    boot_disk {
        initialize_params {
            image = var.image
        }
    }

    network_interface {
        network = "default"

        access_config {
            
        }
    }
}