resource "tls_private_key" "my-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "public-key" {
  key_name   = "my-key"
  public_key = resource.tls_private_key.my-key.public_key_openssh

  provisioner "local-exec" {
    environment = {
      PRIVATE_KEY = resource.tls_private_key.my-key.private_key_pem
    }
    command = "echo \"$PRIVATE_KEY\" > my-tr-key.pem && chmod 400 my-tr-key.pem"
  }
}
