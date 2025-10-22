variable "aws_region" {
  description = "AWS region where resources should be created"
  type        = string
  default     = "ap-south-1"
}

variable "aws_access_key" {
  description = "AWS access key"
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  sensitive   = true
}
