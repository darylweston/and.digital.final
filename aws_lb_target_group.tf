resource "aws_lb_target_group" "tg" {
  name                 = "${var.env}-alb-target-group"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = aws_vpc.daryls-vpc.id
  deregistration_delay = "20"
  health_check {
    healthy_threshold   = "2"
    interval            = "20"
    timeout             = "19"
    unhealthy_threshold = "2"
    protocol            = "HTTP"
    port                = "80"
  }
  tags = {
    Env = "${var.env}-target-group"
  }
}

resource "aws_lb_target_group" "tg2" {
  name                 = "${var.env}-alb-target-group2"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = aws_vpc.daryls-vpc.id
  deregistration_delay = "20"
  health_check {
    healthy_threshold   = "2"
    interval            = "20"
    timeout             = "19"
    unhealthy_threshold = "2"
    protocol            = "HTTP"
    port                = "80"
  }
  tags = {
    Env = "${var.env}-target-group"
  }
}

resource "aws_lb_target_group" "tg3" {
  name                 = "${var.env}-alb-target-group3"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = aws_vpc.daryls-vpc.id
  deregistration_delay = "20"
  health_check {
    healthy_threshold   = "2"
    interval            = "20"
    timeout             = "19"
    unhealthy_threshold = "2"
    protocol            = "HTTP"
    port                = "80"
  }
  tags = {
    Env = "${var.env}-target-group"
  }
}
