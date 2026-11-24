variable "aws_region" {
  description = "AWS region for the load balancer."
  type        = string
  default     = "ap-south-1"
}
variable "name" {
  description = "Unique load balancer name (up to 32 characters)."
  type        = string
  default     = "terraform-learning-alb"
}
variable "vpc_id" {
  description = "ID of an existing VPC."
  type        = string
}
variable "subnet_ids" {
  description = "At least two subnet IDs in different Availability Zones in the same VPC."
  type        = list(string)
}
variable "target_port" {
  description = "Port on the registered application instances."
  type        = number
  default     = 80
}
variable "allowed_cidr_blocks" {
  description = "IPv4 CIDR blocks allowed to access the ALB listener."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
