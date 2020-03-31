resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.daryls-vpc.id

  tags = {
    Name = "internet_gateway"
  }
}
