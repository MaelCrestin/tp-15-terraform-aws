resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tp-15-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block               = "10.0.1.0/24"
  availability_zone        = "eu-west-3a"
  map_public_ip_on_launch  = true

  tags = {
    Name = "tp-15-public-a"
  }
}

resource "aws_subnet" "prive_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "tp-15-prive-a"
  }
}