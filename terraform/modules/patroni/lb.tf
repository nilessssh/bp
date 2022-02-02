resource "aws_lb_target_group" "target_group" {
  name     = "ha-target-group"
  port     = 7000
  protocol = "TCP"
  vpc_id   = var.vpc_id
  
  depends_on = [
    aws_lb.network_lb
  ]

 lifecycle {
    create_before_destroy = true
  }

  health_check {
    interval            = 30
    port                = 7000
    protocol            = "TCP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb" "network_lb" {
  name               = "ha-nlb"
  load_balancer_type = "network"
  subnets            = var.private_subnet 

  enable_cross_zone_load_balancing = true
}


resource "aws_lb_listener" "nlb_listener" {

  load_balancer_arn = aws_lb.network_lb.arn

  protocol          = "TCP"
  port              = "7000"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_autoscaling_attachment" "target" {

  autoscaling_group_name = var.group_name
  alb_target_group_arn   = aws_lb_target_group.target_group.arn
}

