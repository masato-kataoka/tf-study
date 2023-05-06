resource "aws_lb" "sbcntr-alb-internal" {
  name               = "sbcntr-alb-internal"
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.internal_security_groups
  subnets            = var.container_subnets
}

resource "aws_lb_target_group" "sbcntr-tg-sbcntrdemo-blue" {
  name     = "sbcntr-tg-sbcnrtdemo-blue"
  port     = 80
  protocol = "HTTP"
  protocol_version = "HTTP1"
  target_type = "ip"
  vpc_id   = var.sbcntrVpc_id
  health_check {
    path = "/healthcheck"
    interval = 15
    timeout = 5
    unhealthy_threshold = 2
    matcher = 200
  }
}

resource "aws_lb_listener" "sbcntr-alb-internal_listener" {
  load_balancer_arn = aws_lb.sbcntr-alb-internal.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.sbcntr-tg-sbcntrdemo-blue.arn
  }
}
