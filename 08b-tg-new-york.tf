resource "aws_alb_target_group" "new_york_http_target_group" {
  provider    = aws.nvirginia
  name        = "new-york-http-target-group"
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

  vpc_id = aws_vpc.new_york_vpc.id
  tags = {
    Name    = "new_york_http_target_group"
    Service = var.main_service
  }
}

# resource "aws_alb_target_group" "new_york_tls_target_group" {
#     provider = aws.nvirginia
#   name        = "new_york-tls-target-group"
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

#   vpc_id = aws_vpc.new_york_vpc.id
#   tags = {
#     Name = "new_york_https_target_group"
#   }
# }