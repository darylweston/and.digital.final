resource "aws_autoscaling_group" "asg" {
  name                      = "autoscaling_group"
  max_size                  = var.max
  min_size                  = var.min
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.lc.name
  vpc_zone_identifier       = ["${aws_subnet.public1.id}", "${aws_subnet.public2.id}"]
  availability_zones        = [var.az1, var.az2]
  target_group_arns         = aws_lb_target_group.tg.*.arn

  enabled_metrics = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

resource "aws_autoscaling_group" "asg2" {
  name                      = "autoscaling_group2"
  max_size                  = var.max
  min_size                  = var.min
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.lc.name
  vpc_zone_identifier       = ["${aws_subnet.public1.id}", "${aws_subnet.public2.id}"]
  availability_zones        = [var.az3, var.az4]
  target_group_arns         = aws_lb_target_group.tg2.*.arn

  enabled_metrics = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

resource "aws_autoscaling_group" "asg3" {
  name                      = "autoscaling_group3"
  max_size                  = var.max
  min_size                  = var.min
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.lc.name
  vpc_zone_identifier       = ["${aws_subnet.public1.id}", "${aws_subnet.public2.id}"]
  availability_zones        = [var.az5, var.az6]
  target_group_arns         = aws_lb_target_group.tg3.*.arn

  enabled_metrics = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

resource "aws_autoscaling_policy" "aps" {
  name                   = "${var.env}-auto-scaling-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "aps2" {
  name                   = "${var.env}-auto-scaling-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg2.name
}

resource "aws_autoscaling_policy" "aps3" {
  name                   = "${var.env}-auto-scaling-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg3.name
}

resource "aws_launch_configuration" "lc" {
  name          = "launch_configuration"
  image_id      = var.ami
  key_name      = var.key_pair
  security_groups = [aws_security_group.ssh.id]
  instance_type = "t2.micro"
}

//listener

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

//listener rules

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
  lifecycle {
    ignore_changes = [priority]
  }
}

resource "aws_lb_listener_rule" "static2" {
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
  lifecycle {
    ignore_changes = [priority]
  }
}

resource "aws_lb_listener_rule" "static3" {
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg3.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
  lifecycle {
    ignore_changes = [priority]
  }
}
