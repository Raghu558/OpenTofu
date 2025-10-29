variable "bucket_name" {
  default = "tofu-infra-bucket-12345"
}
variable "versioning_status" {
  default = false
}

variable "aws_region" {

}

variable "aws_access_key" {

}

variable "aws_secret_key" {

}

variable "cluster_name" {}
variable "vpc_cidr" {}
variable "private_subnets" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "desired_size" { type = number }
variable "max_size" { type = number }
variable "min_size" { type = number }
variable "instance_type" { default = "t3.medium" }
variable "node_group_name" {}
