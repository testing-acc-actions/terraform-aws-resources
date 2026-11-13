output "load_balancer_dns_name" {
  description = "DNS name of the application load balancer."
  value       = aws_lb.demo.dns_name
}
output "load_balancer_arn" {
  description = "ARN of the application load balancer."
  value       = aws_lb.demo.arn
}
output "target_group_arn" {
  description = "ARN of the target group. Register healthy targets before expecting responses."
  value       = aws_lb_target_group.demo.arn
}
