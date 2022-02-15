locals {
  # Generate a name for the key including its creation date
  key_name = "${var.name}-${substr(time_static.now.rfc3339, 0, 10)}"
}

resource "tls_private_key" "main" {
  /*
  The SSH private key

  It holds the private part of the key, and it will be saved as plain text to
  the Terraform state. BE CAREFUL.
  */
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "main" {
  /*
  The public key in EC2

  AWS only holds the public key; only allowed users with the private key should
  be able to use it to connect to services using the key pair.
  */
  key_name = local.key_name
  public_key = tls_private_key.main.public_key_openssh
}

resource "time_static" "now" {
  /*
  The timestamp of the key creation
  */
  triggers = {
    public_key = tls_private_key.main.public_key_openssh
  }
}
