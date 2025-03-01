resource "aws_subnet" "public_subnet_2a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PUBLIC-SUBNET-2A"
  }
}

resource "aws_subnet" "public_subnet_2b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PUBLIC-SUBNET-2B"
  }
}