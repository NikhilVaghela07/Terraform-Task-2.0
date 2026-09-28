provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  subnet_a_zone      = var.subnet_a_zone
  routing_traffic    = var.routing_traffic
  tags_for_vpc       = var.tag-for-vpc
}

module "ec2_instances" {
  source            = "./modules/ec2"
  count             = 2
  instance_tp     = var.instance_tp
  key_name          = aws_key_pair.public-key.key_name
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
  tags_for_ec2      = var.tag-for-ec2
}

module "security_group" {
  source               = "./modules/sg"
  vpc_id               = module.vpc.vpc_id
  security_group_name  = var.security_group_name
  ports_for_sg         = var.ports_for_sg
  ip_protocol_sg       = var.ip_protocol_sg
  cidr_outgoing        = var.cidr_outgoing
  incomming_cidr_block = var.incomming_cidr_block
  tags_for_sg          = var.tag-for-sg
}
