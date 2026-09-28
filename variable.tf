variable "vpc_cidr_block" {
  description = "cidr block for vpc"
}

variable "instance_tp" {
  type        = string
  description = "only t2.micro or t3.micro allowed"
  # validation {
  #   condition     = contains(["t2.micro", "t3.micro"], var.instance_tp)
  #   error_message = "Not alloed FIx it"
  # }
}

variable "security_group_name" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "routing_traffic" {
  type = list(string)
}

variable "ports_for_sg" {
  type = string
}

variable "incomming_cidr_block" {
  type = set(string)
}

variable "subnet_a_zone" {
  type = string
}

variable "cidr_outgoing" {
  type = string
}


variable "ip_protocol_sg" {
  type = string
}

variable "tag-for-ec2" {
  type = map(string)
}

variable "tag-for-vpc" {
  type = map(string)
}

variable "tag-for-sg" {
  type = map(string)
}