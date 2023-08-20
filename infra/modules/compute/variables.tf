variable "ec2_ami" {
  type = string
}

variable "ec2_type" {
  type = string
}

variable "project" {
  description = "Name of the project deployment."
  type        = string
}

variable "key_name" {
  type = string
}

variable "user_home_directory" {
  type = string
}

variable "nodes_subnet" {}

variable "vpc_id" {}

variable "http_security_group" {}

variable "ssh_security_group" {}

variable "vpc_traffic_security_group" {}

variable "go_outside_security_group" {}

variable "availability_zones" {
  type = list(any)
}

variable "project_path" {
  type = string
}
