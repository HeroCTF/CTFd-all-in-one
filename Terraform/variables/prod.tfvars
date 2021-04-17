variable "instance_name" {
  type    = string
  default = "challs"
}

variable "instance_type" {
  type    = string
  default = "e2-standard-2"
}

variable "number_of_instances" {
  type    = number
  default = 2
}