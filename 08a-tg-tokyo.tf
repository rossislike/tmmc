resource "aws_alb_target_group" "tokyo_http_target_group" {
  provider    = aws.tokyo
  name        = "tokyo-http-target-group"
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

  vpc_id = aws_vpc.tokyo_vpc.id
  tags = {
    Name    = "tokyo_http_target_group"
    Service = var.main_service
  }
}

# resource "aws_alb_target_group" "tokyo_tls_target_group" {
#     provider = aws.tokyo
#   name        = "tokyo-tls-target-group"
#   target_type = "instance"
#   port        = 80
#   protocol    = "HTTP"

#   health_check {
#     enabled             = true
#     interval            = 30
#     path                = "/"
#     protocol            = "HTTP"
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#     timeout             = 5
#     matcher             = "200"
#   }

#   vpc_id = aws_vpc.tokyo_vpc.id
#   tags = {
#     Name = "tokyo_https_target_group"
#   }
# }