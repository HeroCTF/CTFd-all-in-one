variable "challs_instance_name" {
  type = string
  description = "Name of challs VM."
}

variable "challs_instance_type" {
  type = string
  description = "Type of challs VM."
}

variable "challs_count" {
  type = number
  description = "Number of challs VM."
}

variable "box_instance_name" {
  type = string
  description = "Name of box VM."
}

variable "box_instance_type" {
  type = string
  description = "Type of box VM."
}

variable "box_count" {
  type = number
  description = "Number of box VM."
}

variable "zone" {
  type = string
}

variable "image" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "subnetwork_name" {
  type = string
}

variable "ssh_user" {
  default = "heroctf"
}

variable "ssh_pub_key" {
  default = "./credentials/gcp.pub"
}