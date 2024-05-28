module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = data.aws_subnet_ids.selected.ids
  vpc_id          = data.aws_vpc.selected.id

  tags = {
    Environment = "govcloud"
    Terraform   = "true"
  }
}
