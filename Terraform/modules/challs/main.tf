resource "google_compute_instance" "challs" {
    name         = var.instance_name
    machine_type = var.instance_type
    zone         = var.zone
    # count       = var.number_of_instances

    boot_disk {
        initialize_params {
            image = var.image
            size = var.disk_size
        }
    }

    network_interface {
        subnetwork = var.subnetwork_name

        access_config {
            
        }
    }
}