variable "aws_region" {
  description = "AWS region for the Aurora cluster."
  type        = string
  default     = "ap-south-1"
}
variable "cluster_identifier" {
  description = "Unique Aurora cluster identifier."
  type        = string
  default     = "terraform-learning-aurora"
}
variable "vpc_id" {
  description = "ID of the VPC where Aurora will run."
  type        = string
}
variable "subnet_ids" {
  description = "At least two private subnet IDs in different Availability Zones."
  type        = list(string)
}
variable "allowed_cidr_blocks" {
  description = "Private application CIDR blocks permitted to connect on PostgreSQL port 5432."
  type        = list(string)
}
variable "database_name" {
  description = "Initial database name."
  type        = string
  default     = "learningdb"
}
variable "master_username" {
  description = "Aurora master username."
  type        = string
  default     = "dbadmin"
}
variable "master_password" {
  description = "Aurora master password. Supply securely; do not commit it to Git."
  type        = string
  sensitive   = true
}