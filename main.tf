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
