resource "aws_vpc" "vpc_for_ec2" {
  cidr_block = var.vpc_cidr_block
  tags = var.tags_for_vpc
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_for_ec2.id
}

resource "aws_subnet" "secure_ec2_subnet" {
  vpc_id            = aws_vpc.vpc_for_ec2.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.subnet_a_zone
}

resource "aws_route_table" "route_table_for_ec2" {
  vpc_id = aws_vpc.vpc_for_ec2.id
  dynamic "route" {
    for_each = var.routing_traffic
    content {
      cidr_block = route.value
      gateway_id = aws_internet_gateway.gw.id
    }
  }
}