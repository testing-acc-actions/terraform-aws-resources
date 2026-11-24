variable "aws_region" {
  description = "AWS region for the VPC."
  type        = string
  default     = "ap-south-1"
}
variable "vpc_name" {
  description = "Name tag for the VPC."
  type        = string
  default     = "terraform-learning-vpc"
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks inside the VPC CIDR."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks inside the VPC CIDR."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}
variable "environment" {
  description = "Environment tag."
  type        = string
  default     = "learning"
}
