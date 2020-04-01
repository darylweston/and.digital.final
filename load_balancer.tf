resource "aws_lb" "load_balancer" {
  idle_timeout       = 120
  internal           = false
  name               = "${var.env}-daryls-lb"
  load_balancer_type = "application"
  # security_groups    = ["${aws_security_group.elb.id}"]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id, aws_subnet.private1.id]

  enable_deletion_protection = false

  tags = {
    Environment = "${var.env}"
  }
}
