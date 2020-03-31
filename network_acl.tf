resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.daryls-vpc.id
  subnet_ids = [aws_subnet.public1.id]

  ingress {
    protocol   = "tcp" // Allows inbound HTTP traffic from any IPv4 address.
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp" // Allows inbound HTTPS traffic from any IPv4 address.
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp" // Allows inbound SSH traffic from your internet or home network (over the internet gateway).
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp" // Allows inbound RDP traffic from internet or home network (over the internet gateway).
    rule_no    = 130
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 3389
    to_port    = 3389
  }

  egress {
    protocol   = "tcp" // Allows outbound HTTP traffic from the subnet to the internet.
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "tcp" // Allows outbound HTTPS traffic from the subnet to the internet.
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    protocol   = "tcp" // Allows outbound SSH access to instances in your private subnet (bastion host)
    rule_no    = 150
    action     = "allow"
    cidr_block = "10.0.30.0/24"
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "main"
  }
}
