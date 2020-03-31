# Create a VPC
resource "aws_vpc" "daryls-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}
