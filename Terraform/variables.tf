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

variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "number_of_instances" {
  type = number
}

variable "disk_size" {
  type = number
}

variable "vm_type" {
  type = map(string)
  default = {
    "1gig"  = "e2-micro"
    "2gig"  = "e2-small"
    "4gig"  = "e2-medium"
    "8gig"  = "e2-standard-2"
    "16gig" = "e2-standard-4"
    "32gig" = "e2-standard-8"
  }
}

variable "os" {
  type = map(string)
  default = {
    "debian9"  = "debian-cloud/debian-9"
    "debian10" = "debian-cloud/debian-10"
  }
}

variable "subnetwork_region" {
  default = "europe-west2"
}

variable "network" {
  default = "heroctf-network"
}