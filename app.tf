resource "aws_instance" "app" {
  ami                          = data.aws_ami.amazon_linux.id
  instance_type                = "t3.micro"
  subnet_id                    = aws_subnet.prive_a.id
  vpc_security_group_ids       = [aws_security_group.prive.id]
  key_name                     = aws_key_pair.tp15.key_name
  associate_public_ip_address  = false

  tags = {
    Name = "tp-15-app"
  }
}