resource "aws_alb_target_group" "hongkong_http_target_group" {
  provider    = aws.hongkong
  name        = "hongkong-http-target-group"
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

  vpc_id = aws_vpc.hongkong_vpc.id
  tags = {
    Name    = "hongkong_http_target_group"
    Service = var.main_service
  }
}

# Uncomment and customize the following for a TLS target group if needed.
# resource "aws_alb_target_group" "hongkong_tls_target_group" {
#   provider    = aws.hongkong
#   name        = "hongkong-tls-target-group"
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

#   vpc_id = aws_vpc.hongkong_vpc.id
#   tags = {
#     Name = "hongkong_https_target_group"
#   }
# }
