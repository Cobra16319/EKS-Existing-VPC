resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = module.eks.cluster_id
  node_group_name = "eks-nodes"
  node_role_arn   = var.node_role_arn
  subnet_ids      = data.aws_subnets.selected.ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  instance_types = [var.instance_type]

  tags = {
    Environment = "govcloud"
    Terraform   = "true"
  }
}



