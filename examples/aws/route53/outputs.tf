output "record_fqdn" {
  description = "Fully qualified DNS record name."
  value       = aws_route53_record.demo.fqdn
}
output "record_type" {
  description = "DNS record type."
  value       = aws_route53_record.demo.type
}
