vpc_cidr_block       = "10.0.0.0/16"
instance_tp          = "t2.micro"
security_group_name  = "SecureEC2instance"
public_subnet_cidr   = "10.0.1.0/24"
routing_traffic      = ["182.76.141.104/29", "115.112.142.32/29", "14.97.73.248/29"]
ports_for_sg         = 22
incomming_cidr_block = ["182.76.141.104/29", "115.112.142.32/29", "14.97.73.248/29"]
subnet_a_zone        = "us-east-1a"
cidr_outgoing        = "0.0.0.0/0"
ip_protocol_sg       = "tcp"
tag-for-ec2 = {
  Name = "EC2Instance"
}
tag-for-vpc = {
  Name = "VPC"
}
tag-for-sg = {
  Name = "SecurityGroup"
}