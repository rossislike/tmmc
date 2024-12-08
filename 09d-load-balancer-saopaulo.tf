resource "aws_lb" "saopaulo_lb" {
  provider = aws.saopaulo
  name     = "saopaulo-lb"

  subnet_mapping {
    subnet_id = aws_subnet.saopaulo_pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.saopaulo_pub_subnet_1b.id
  }

  security_groups    = [aws_security_group.saopaulo_sg_lb.id]
  load_balancer_type = "application"
  internal           = false

  tags = {
    Name = "saopaulo_lb"
  }
}

resource "aws_lb_listener" "saopaulo_lb_http_listener" {
  provider          = aws.saopaulo
  load_balancer_arn = aws_lb.saopaulo_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.saopaulo_http_target_group.arn
  }

  tags = {
    Name = "saopaulo_lb_http_listener"
  }
}

# resource "aws_lb_listener" "saopaulo_alb_tls_listener" {
#     provider = aws.saopaulo
#   load_balancer_arn = aws_lb.saopaulo_lb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.saopaulo_tls_target_group.arn
#   }

#   certificate_arn = data.aws_acm_certificate.issued.arn

#   tags = {
#     Name = "saopaulo_alb_tls_listener"
#   }
# }
