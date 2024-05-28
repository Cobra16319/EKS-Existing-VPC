provider "aws" {
  region = "us-gov-east-1"
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["sample-aws-vpc"]
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

