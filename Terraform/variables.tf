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

variable "challs_instance_name" {
  type        = string
  description = "Name of challs VM."
}

variable "challs_instance_type" {
  type        = string
  description = "Type of challs VM."
}

variable "challs_count" {
  type        = number
  description = "Number of challs VM."
}

variable "box_instance_name" {
  type        = string
  description = "Name of box VM."
}

variable "box_instance_type" {
  type        = string
  description = "Type of box VM."
}

variable "box_count" {
  type        = number
  description = "Number of box VM."
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