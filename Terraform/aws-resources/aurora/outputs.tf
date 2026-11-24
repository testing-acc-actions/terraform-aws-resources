output "cluster_endpoint" {
  description = "Writer endpoint for the Aurora cluster."
  value       = aws_rds_cluster.aurora.endpoint
}
output "cluster_reader_endpoint" {
  description = "Reader endpoint for the Aurora cluster."
  value       = aws_rds_cluster.aurora.reader_endpoint
}
output "cluster_identifier" {
  description = "Aurora cluster identifier."
  value       = aws_rds_cluster.aurora.id
}
output "cluster_port" {
  description = "Database port."
  value       = aws_rds_cluster.aurora.port
}