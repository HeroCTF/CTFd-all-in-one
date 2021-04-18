module "challs_instance" {
  source = "./modules/challs"

  challs_instance_name = var.challs_instance_name
  challs_instance_type = var.challs_instance_type
  challs_count         = var.challs_count

  box_instance_name = var.box_instance_name
  box_instance_type = var.box_instance_type
  box_count         = var.box_count

  zone      = var.zone
  image     = var.os["debian10"]
  disk_size = var.disk_size
}