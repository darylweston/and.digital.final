resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.daryls-vpc.id
  cidr_block              = var.public_subnet1
  availability_zone       = var.az1
  map_public_ip_on_launch = true

  tags = {
    Name = "Public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.daryls-vpc.id
  cidr_block              = var.public_subnet2
  availability_zone       = var.az2

  tags = {
    Name = "Public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.daryls-vpc.id
  cidr_block              = var.private_subnet1
  availability_zone       = var.az3

  tags = {
    Name = "Private1"
  }
}
