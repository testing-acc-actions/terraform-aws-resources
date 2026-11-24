variable "aws_region" {
  description = "AWS region for the S3 bucket."
  type        = string
  default     = "ap-south-1"
}
variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string
}
variable "environment" {
  description = "Environment tag."
  type        = string
  default     = "learning"
}
