resource "aws_cloudwatch_metric_alarm" "test_signal" {
  alarm_name        = "${var.project_name}-test-alarm"
  alarm_description = "Practice alarm for testing CloudWatch metric data"

  namespace   = "Practice/CloudWatch"
  metric_name = "TestSignal"

  dimensions = {
    Environment = "Learning"
  }

  statistic = "Average"
  period    = 60

  evaluation_periods  = 1
  datapoints_to_alarm = 1

  threshold           = 50
  comparison_operator = "GreaterThanThreshold"

  treat_missing_data = "notBreaching"

  tags = {
    Project     = var.project_name
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
