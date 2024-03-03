variable "private_cidr" {
  type    = list(string)
  default = [""]
}
variable "availability_zones" {
  type    = list(string)
  default = [""]
}

variable "public_cidr" {
  type    = list(string)
  default = [""]
}

variable "region" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "cidr_block" {
  type    = string
  default = ""
}

variable "log_destination" {
  type = string
  default = ""
}
variable "log_destination_type" {
  type = string
}