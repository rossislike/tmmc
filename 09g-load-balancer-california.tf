resource "aws_lb" "california_lb" {
  provider = aws.california
  name     = "california-lb"

  subnet_mapping {
    subnet_id = aws_subnet.california_pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.california_pub_subnet_1b.id
  }

  security_groups    = [aws_security_group.california_sg_lb.id]
  load_balancer_type = "application"
  internal           = false

  tags = {
    Name = "california_lb"
  }
}

resource "aws_lb_listener" "california_lb_http_listener" {
  provider          = aws.california
  load_balancer_arn = aws_lb.california_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.california_http_target_group.arn
  }

  tags = {
    Name = "california_lb_http_listener"
  }
}

# Uncomment and customize for TLS listener if needed.
# resource "aws_lb_listener" "california_alb_tls_listener" {
#   provider          = aws.california
#   load_balancer_arn = aws_lb.california_lb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.california_tls_target_group.arn
#   }

#   certificate_arn = data.aws_acm_certificate.issued.arn

#   tags = {
#     Name = "california_alb_tls_listener"
#   }
# }
