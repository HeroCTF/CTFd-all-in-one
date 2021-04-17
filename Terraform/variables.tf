variable "project" {
  type    = string
  default = "heroctf"
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "zone" {
  type    = string
  default = "europe-west2-c"
}

variable "image" {
  type = string
  default = "debian-cloud/debian-10"
}

variable "instance_name" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "number_of_instances" {
  type    = number
}

variable "disk_size" {
  type    = number
}