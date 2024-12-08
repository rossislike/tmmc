resource "aws_lb" "tokyo_lb" {
  provider = aws.tokyo
  name     = "tokyo-lb"

  subnet_mapping {
    subnet_id = aws_subnet.tokyo_pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.tokyo_pub_subnet_1c.id
  }

  security_groups    = [aws_security_group.tokyo_sg_lb.id]
  load_balancer_type = "application"
  internal           = false

  tags = {
    Name = "tokyo_lb"
  }
}

resource "aws_lb_listener" "tokyo_lb_http_listener" {
  provider          = aws.tokyo
  load_balancer_arn = aws_lb.tokyo_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tokyo_http_target_group.arn
  }

  tags = {
    Name = "tokyo_lb_http_listener"
  }
}

# data "aws_acm_certificate" "issued" {
#   domain   = "rumothy.com"
#   statuses = ["ISSUED"]
# }

# resource "aws_lb_listener" "tokyo_alb_tls_listener" {
#     provider = aws.tokyo
#   load_balancer_arn = aws_lb.tokyo_lb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.tokyo_tls_target_group.arn
#   }

#   certificate_arn = data.aws_acm_certificate.issued.arn

#   tags = {
#     Name = "tokyo_alb_tls_listener"
#   }
# }



