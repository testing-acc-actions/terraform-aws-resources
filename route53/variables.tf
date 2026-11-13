variable "aws_region" {
  description = "Provider region; Route 53 itself is a global service."
  type        = string
  default     = "ap-south-1"
}
variable "hosted_zone_id" {
  description = "ID of an existing Route 53 hosted zone."
  type        = string
}
variable "record_name" {
  description = "DNS record name, such as app.example.com."
  type        = string
}
variable "record_target" {
  description = "Target hostname for the CNAME record."
  type        = string
}
