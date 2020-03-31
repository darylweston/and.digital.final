# Define the route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.daryls-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Assign the route table to the public Subnet1
resource "aws_route_table_association" "public_rta_1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

# Assign the route table to the public Subnet2
resource "aws_route_table_association" "public_rta_2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

# Assign private route table to the public Subnet1
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.public_rt.id
}
