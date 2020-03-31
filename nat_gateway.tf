resource "aws_eip" "nat_eip" {
  count = "1"
  vpc   = true
  tags = {
    name = "${var.env} public IP address"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  count         = "1"
  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.public1.id
  depends_on    = [aws_internet_gateway.gw]
}
