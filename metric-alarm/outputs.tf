output "cloudwatch_alarm_name" {
  description = "Name of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.test_signal.alarm_name
}

output "cloudwatch_alarm_arn" {
  description = "ARN of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.test_signal.arn
}

output "cloudwatch_alarm_state" {
  description = "Current alarm state"
  value       = aws_cloudwatch_metric_alarm.test_signal.state
}
