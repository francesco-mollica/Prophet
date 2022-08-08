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
  count = 2
  availability_zone = aws_subnet.private_subnet.availability_zone
  size              = 11
  type = "gp2"
  // encrypted = false
  // throughput = ...
}

resource "aws_volume_attachment" "ebs_att" {
  count = 2
  device_name = "/dev/xdvf"
  volume_id   = aws_ebs_volume.ebs[count.index].id
  instance_id = aws_instance.web[count.index].id
}



