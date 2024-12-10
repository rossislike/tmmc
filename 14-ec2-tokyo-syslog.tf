resource "aws_instance" "tokyo_syslog_inst" {
  provider      = aws.tokyo
  ami           = "ami-023ff3d4ab11b2525"
  instance_type = "t2.micro"
  key_name      = "MyLinuxBox"
  user_data     = filebase64("${path.module}/basic_userdata.sh")
  network_interface {
    network_interface_id = aws_network_interface.tokyo_syslog_iface.id
    device_index         = 0
  }

  tags = {
    Name    = "tokyo_syslog_inst"
    Service = var.main_service
  }
}

resource "aws_network_interface" "tokyo_syslog_iface" {
  provider        = aws.tokyo
  subnet_id       = aws_subnet.tokyo_prv_subnet_1d.id
  security_groups = [aws_security_group.tokyo_sg_lt.id]
  tags = {
    Name    = "tokyo_syslog_iface"
    Service = var.main_service
  }
}