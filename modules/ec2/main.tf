data "aws_ami" "letest_ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.letest_ubuntu.id
  instance_type          = var.instance_tp
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  associate_public_ip_address = true 
  tags                   = var.tags_for_ec2
}

resource "aws_eip" "eip_for_ec2" {
  tags = {
    Name = "Eip For Secure EC2"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.eip_for_ec2.id
}
