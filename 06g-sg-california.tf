resource "aws_security_group" "california_sg_lt" {
  provider    = aws.california
  vpc_id      = aws_vpc.california_vpc.id
  name        = "california-sg-lt"
  description = "california-sg-lt"

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
    Name    = "california-sg-lt"
    Service = var.main_service
  }
}
