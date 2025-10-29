module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.2.1"

  cluster_name                         = var.cluster_name
  cluster_version                      = "1.30"
  subnet_ids                           = module.vpc.private_subnets
  vpc_id                               = module.vpc.vpc_id
  cluster_endpoint_public_access       = true
  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  enable_irsa = true

  eks_managed_node_groups = {
    obs_private = {
      # node_group_name = var.node_group_name
      module       = module.vpc.private_subnets
      desired_size = var.desired_size
      max_size     = var.max_size
      min_size     = var.min_size

      capacity_type = "ON_DEMAND"
      disk_size     = 20

      iam_additional_policies = {
        asg_access          = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
        external_dns_access = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
        full_ecr_access     = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
        appmesh_access      = "arn:aws:iam::aws:policy/AWSAppMeshFullAccess"
        alb_ingress_access  = "arn:aws:iam::aws:policy/AWSLoadBalancerControllerIAMPolicy"
      }

      labels = {
        role = "observability-node"
      }

      instance_types = [var.instance_type]
    }
  }

  tags = {
    Environment = "dev"
    Project     = "OpenTofu-EKS"
  }
}

resource "null_resource" "update_kubeconfig" {
  depends_on = [module.eks]

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.aws_region}"
  }
}

# resource "aws_eks_node_group" "config_auth" {
#   depends_on = [module.eks]

#   lifecycle {
#     ignore_changes = all
#   }
# }

