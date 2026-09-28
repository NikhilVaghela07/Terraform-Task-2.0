
variable "instance_tp" {
  type        = string
  description = "only t2.micro or t3.micro allowed"
  # validation {
  #   condition     = contains(["t2.micro", "t3.micro"], var.instance_tp)
  #   error_message = "Not alloed FIx it"
  # }
  # default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "tags_for_ec2" {
  type = map(string)
}
