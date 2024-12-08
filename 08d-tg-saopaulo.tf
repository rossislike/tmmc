resource "aws_alb_target_group" "saopaulo_http_target_group" {
  provider    = aws.saopaulo
  name        = "saopaulo-http-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  vpc_id = aws_vpc.saopaulo_vpc.id
  tags = {
    Name    = "saopaulo_http_target_group"
    Service = var.main_service
  }
}

# Uncomment and customize the following for a TLS target group if needed.
# resource "aws_alb_target_group" "saopaulo_tls_target_group" {
#   provider    = aws.saopaulo
#   name        = "saopaulo-tls-target-group"
#   target_type = "instance"
#   port        = 443
#   protocol    = "HTTPS"

#   health_check {
#     enabled             = true
#     interval            = 30
#     path                = "/"
#     protocol            = "HTTPS"
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#     timeout             = 5
#     matcher             = "200"
#   }

#   vpc_id = aws_vpc.saopaulo_vpc.id
#   tags = {
#     Name = "saopaulo_https_target_group"
#   }
# }
