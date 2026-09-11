resource "tls_private_key" "tp15" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "tp15" {
  key_name   = "tp-15-cle"
  public_key = tls_private_key.tp15.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.tp15.private_key_openssh
  filename        = "${path.module}/tp-15-cle.pem"
  file_permission = "0400"
}