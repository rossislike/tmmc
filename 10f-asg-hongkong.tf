resource "aws_autoscaling_group" "hongkong_http_asg" {
  provider                  = aws.hongkong
  name                      = "hongkong-http-asg"
  max_size                  = 4
  min_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 300
  default_instance_warmup   = -1

  launch_template {
    id      = aws_launch_template.hongkong_http_lt.id
    version = "$Default"
  }

  vpc_zone_identifier = [
    aws_subnet.hongkong_prv_subnet_1a.id,
    aws_subnet.hongkong_prv_subnet_1b.id
  ]
  health_check_type = "ELB"
  target_group_arns = [aws_alb_target_group.hongkong_http_target_group.arn]

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 100
  }

  tag {
    key                 = "name"
    value               = "hongkong_http_asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "hongkong_http_asg_policy" {
  provider               = aws.hongkong
  name                   = "Target Tracking Policy"
  autoscaling_group_name = aws_autoscaling_group.hongkong_http_asg.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    disable_scale_in = false
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75
  }
}

# resource "aws_autoscaling_group" "hongkong_tls_asg" {
#     provider = aws.hongkong
#   name                      = "hongkong_tls_asg"
#   max_size                  = 6
#   min_size                  = 1
#   desired_capacity          = 3
#   health_check_grace_period = 300
#   default_instance_warmup   = -1

#   launch_template {
#     id      = aws_launch_template.hongkong_tls_lt.id
#     version = "$Default"
#   }

#   vpc_zone_identifier = [
#     aws_subnet.hongkong_prv_subnet_1a.id,
#     aws_subnet.hongkong_prv_subnet_1c.id
#   ]
#   health_check_type = "ELB"
#   target_group_arns = [aws_alb_target_group.hongkong_tls_target_group.arn]

#   instance_maintenance_policy {
#     min_healthy_percentage = 90
#     max_healthy_percentage = 100
#   }

#   tag {
#     key                 = "name"
#     value               = "hongkong_tls_asg"
#     propagate_at_launch = true
#   }
# }

# resource "aws_autoscaling_policy" "hongkong_tls_asg_policy" {
#     provider = aws.hongkong
#   name                   = "Target Tracking Policy"
#   autoscaling_group_name = aws_autoscaling_group.hongkong_tls_asg.name
#   policy_type            = "TargetTrackingScaling"
#   target_tracking_configuration {
#     disable_scale_in = false
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75
#   }
# }
