module "challs_instance" {
  source = "./modules/challs"

  instance_name       = var.instance_name
  instance_type       = var.instance_type
  number_of_instances = var.number_of_instances
  zone                = var.zone
  image               = var.image
  disk_size           = var.disk_size
}