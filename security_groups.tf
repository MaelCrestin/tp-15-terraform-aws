resource "aws_security_group" "bastion" {
  name        = "tp-15-sg-bastion"
  description = "SG bastion tp-15 - SSH depuis mon poste"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH depuis mon poste"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tp-15-sg-bastion"
  }
}

resource "aws_security_group" "prive" {
  name        = "tp-15-sg-prive"
  description = "SG instance privee tp-15 - SSH depuis le bastion"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "SSH depuis le groupe bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tp-15-sg-prive"
  }
}
