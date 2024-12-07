resource "aws_security_group" "hongkong_sg_lt" {
  provider    = aws.hongkong
  vpc_id      = aws_vpc.hongkong_vpc.id
  name        = "hongkong-sg-lt"
  description = "hongkong-sg-lt"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress { 
  #     from_port = 443
  #     to_port = 443
  #     protocol = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"] 
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "hongkong-sg-lt"
    Service = var.main_service
  }
}
