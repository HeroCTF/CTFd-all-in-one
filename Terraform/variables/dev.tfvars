variable "instance_name" {
  type    = string
  default = "challs"
}

variable "instance_type" {
  type    = string
  default = "f1-micro"
}

variable "number_of_instances" {
  type    = number
  default = 1
}