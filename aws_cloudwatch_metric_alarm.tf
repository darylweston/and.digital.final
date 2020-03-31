resource "aws_cloudwatch_metric_alarm" "aps" {
  alarm_name          = "${var.env}-cloudwatch-micro-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 85

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.asg.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = ["${aws_autoscaling_policy.aps.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "aps2" {
  alarm_name          = "${var.env}-cloudwatch-micro-alarm2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 85

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.asg2.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = ["${aws_autoscaling_policy.aps.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "aps3" {
  alarm_name          = "${var.env}-cloudwatch-micro-alarm3"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 85

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.asg3.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = ["${aws_autoscaling_policy.aps.arn}"]
}
