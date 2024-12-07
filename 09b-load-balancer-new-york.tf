resource "aws_lb" "new_york_lb" {
  provider = aws.nvirginia
  name     = "new-york-lb"

  subnet_mapping {
    subnet_id = aws_subnet.new_york_pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.new_york_pub_subnet_1b.id
  }

  security_groups    = [aws_security_group.new_york_sg_lb.id]
  load_balancer_type = "application"
  internal           = false

  tags = {
    Name = "new_york_lb"
  }
}

resource "aws_lb_listener" "new_york_lb_http_listener" {
  provider          = aws.nvirginia
  load_balancer_arn = aws_lb.new_york_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.new_york_http_target_group.arn
  }

  tags = {
    Name = "new_york_lb_http_listener"
  }
}


# resource "aws_lb_listener" "new_york_alb_tls_listener" {
#     provider = aws.nvirginia
#   load_balancer_arn = aws_lb.new_york_lb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.new_york_tls_target_group.arn
#   }

#   certificate_arn = data.aws_acm_certificate.issued.arn

#   tags = {
#     Name = "new_york_alb_tls_listener"
#   }
# }