provider "aws" {
  region = "us-gov-east-1"
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["sample-aws-vpc"]
  }
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"
  subnets         = data.aws_subnet_ids.selected.ids
  vpc_id          = data.aws_vpc.selected.id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "m5.large"
    }
  }

  tags = {
    Environment = "govcloud"
    Terraform   = "true"
  }
}
