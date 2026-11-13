variable "aws_region" {
  description = "AWS region for the Lambda function."
  type        = string
  default     = "ap-south-1"
}
variable "function_name" {
  description = "Name of the Lambda function."
  type        = string
  default     = "terraform-learning-function"
}
variable "environment" {
  description = "Environment tag."
  type        = string
  default     = "learning"
}
