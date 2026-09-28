output "vpc_id" {
  value = aws_vpc.vpc_for_ec2.id
}

output "subnet_id" {
  value = aws_subnet.secure_ec2_subnet.id
}