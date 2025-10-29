variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string

}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}
variable "private_subnets" {
  description = "List of private subnet CIDR blocks."
  type        = list(string)
}
variable "public_subnets" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
}
variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}
variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}
variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}
variable "instance_type" {
  description = "EC2 instance type for the worker nodes."
  type        = string
}
variable "aws_region" {
  description = "value"
  type        = string
}
variable "node_group_name" {
  description = "Name of node group"
  type        = string
}