
variable "security_group_name" {
  type = string
  description = "Securiy Group Name"
}

variable "vpc_id" {
  type = string
  description = "VPC ID for the security group"
}

variable "incomming_cidr_block" {
  type = set(string)
  description = "Incomming rule CIDR"
}

variable "ports_for_sg" {
  type = string
  description = "Ports for SG"
}

variable "ip_protocol_sg" {
  type = string
  description = "ip protocol for incomming"
}
variable "cidr_outgoing" {
  type = string
  description = "cidr block for outgoing"
}

variable "tags_for_sg" {
  type = map(string)
  description = "Tags for Security Group"
}