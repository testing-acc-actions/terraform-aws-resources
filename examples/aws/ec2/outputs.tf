output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.demo.id
}
output "instance_ami" {
  description = "AMI selected by the data source."
  value       = data.aws_ami.amazon_linux.id
}
output "instance_type" {
  description = "Instance type."
  value       = aws_instance.demo.instance_type
}
