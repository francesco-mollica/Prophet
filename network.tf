resource "aws_vpc" "prophet" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.prophet.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "private_subnet"
  }
}