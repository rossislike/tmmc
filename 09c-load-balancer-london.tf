resource "aws_lb" "london_lb" {
  provider = aws.london
  name     = "london-lb"

  subnet_mapping {
    subnet_id = aws_subnet.london_pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.london_pub_subnet_1b.id
  }

  security_groups    = [aws_security_group.london_sg_lb.id]
  load_balancer_type = "application"
  internal           = false

  tags = {
    Name = "london_lb"
  }
}

resource "aws_lb_listener" "london_lb_http_listener" {
  provider          = aws.london
  load_balancer_arn = aws_lb.london_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.london_http_target_group.arn
  }

  tags = {
    Name = "london_lb_http_listener"
  }
}

# resource "aws_lb_listener" "london_alb_tls_listener" {
#     provider = aws.london
#   load_balancer_arn = aws_lb.london_lb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.london_tls_target_group.arn
#   }

#   certificate_arn = data.aws_acm_certificate.issued.arn

#   tags = {
#     Name = "london_alb_tls_listener"
#   }
# }
