resource "aws_instance" "web" {
  count = 2
  ami           = "ami-05912b6333beaa478"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = aws_subnet.private_subnet.id
  
  root_block_device {
    
    delete_on_termination = true
    volume_type = "gp2"
    volume_size = 30
    // encrpted = false
    // iops = ...
    // throughput = 
  }

  tags = {
    Name = "ec2-prod-${count.index}"
  }
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = aws_subnet.private_subnet.availability_zone
  size              = 10
  type = "gp2"
  // encrypted = false
  // throughput = ...
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.web[0].id

}



