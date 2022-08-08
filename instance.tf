resource "aws_instance" "web" {
  count = 2
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-prod"
  }
}
