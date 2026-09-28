variable "vpc_cidr_block" {
  description = "cidr block for vpc"
  type = string
}

variable "public_subnet_cidr" {
  description = "public subnet cidr block for vpc"
  type = string
}

variable "routing_traffic" {
  description = "route table block for vpc"
  type = list(string)
}

variable "subnet_a_zone" {
  description = "subnet zone for vpc"
  type = string
}

variable "tags_for_vpc" {
  type = map(string)
}