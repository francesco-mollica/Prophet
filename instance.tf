resource "aws_instance" "web" {
  count = 2
  ami           = "ami-05912b6333beaa478"
  instance_type = "t2.micro"
  associate_public_ip_address = false
  

  tags = {
    Name = "ec2-prod-{$count.index}"
  }
}

