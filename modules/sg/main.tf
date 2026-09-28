resource "aws_security_group" "security_group_for_ec2" {
  name   = var.security_group_name
  vpc_id = var.vpc_id
  tags = var.tags_for_sg
}

resource "aws_vpc_security_group_ingress_rule" "incomming_for_ec2" {
  for_each          = var.incomming_cidr_block
  security_group_id = aws_security_group.security_group_for_ec2.id
  from_port         = var.ports_for_sg
  to_port           = var.ports_for_sg
  ip_protocol       = var.ip_protocol_sg
  cidr_ipv4         = each.value
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.security_group_for_ec2.id
  cidr_ipv4         = var.cidr_outgoing
  ip_protocol       = "-1"
}