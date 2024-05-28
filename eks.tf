module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.30.1"  # Ensure this version or the latest compatible one

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = data.aws_vpc.selected.id
  subnet_ids      = data.aws_subnets.selected.ids

  tags = {
    Environment = "govcloud"
    Terraform   = "true"
  }
}




