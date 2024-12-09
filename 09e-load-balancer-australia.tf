resource "aws_lb" "australia_lb" {
  provider = aws.australia
  name     = "australia-lb"

  subnet_mapping {
    subnet_id = aws_subnet.australia_pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.australia_pub_subnet_1b.id
  }

  security_groups    = [aws_security_group.australia_sg_lb.id]
  load_balancer_type = "application"
  internal           = false

  tags = {
    Name = "australia_lb"
  }
}

resource "aws_lb_listener" "australia_lb_http_listener" {
  provider          = aws.australia
  load_balancer_arn = aws_lb.australia_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.australia_http_target_group.arn
  }

  tags = {
    Name = "australia_lb_http_listener"
  }
}

# resource "aws_lb_listener" "australia_alb_tls_listener" {
#     provider = aws.australia
#   load_balancer_arn = aws_lb.australia_lb.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.australia_tls_target_group.arn
#   }

#   certificate_arn = data.aws_acm_certificate.issued.arn

#   tags = {
#     Name = "australia_alb_tls_listener"
#   }
# }
