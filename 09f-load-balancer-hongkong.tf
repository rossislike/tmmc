resource "aws_lb" "hongkong_lb" {
  provider = aws.hongkong
  name     = "hong-kong-lb"

  subnet_mapping {
    subnet_id = aws_subnet.hongkong_pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.hongkong_pub_subnet_1b.id
  }

  security_groups    = [aws_security_group.hongkong_sg_lb.id]
  load_balancer_type = "application"
  internal           = false

  tags = {
    Name = "hong_kong_lb"
  }
}

resource "aws_lb_listener" "hong_kong_lb_http_listener" {
  provider          = aws.hongkong
  load_balancer_arn = aws_lb.hongkong_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.hongkong_http_target_group.arn
  }

  tags = {
    Name = "hong_kong_lb_http_listener"
  }
}

# resource "aws_lb_listener" "hongkong_alb_tls_listener" {
#     provider = aws.hongkong
#   load_balancer_arn = aws_lb.hongkong_lb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.hongkong_tls_target_group.arn
#   }

#   certificate_arn = data.aws_acm_certificate.issued.arn

#   tags = {
#     Name = "hongkong_alb_tls_listener"
#   }
# }
