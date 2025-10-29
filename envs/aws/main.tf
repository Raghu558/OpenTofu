terraform {
  required_version = ">=1.6.0"
}

module "aws_provider" {
  source         = "../../infrastructure/providers/aws"
  aws_region     = var.aws_region
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}

module "aws_s3_bucket" {
  source            = "../../infrastructure/modules/aws/s3"
  bucket_name       = var.bucket_name
  versioning_status = var.versioning_status
}

module "eks" {
  source = "../../infrastructure/modules/aws/eks"

  cluster_name    = var.cluster_name
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  desired_size    = var.desired_size
  max_size        = var.max_size
  min_size        = var.min_size
  instance_type   = var.instance_type
  aws_region      = var.aws_region
  node_group_name = var.node_group_name
}
