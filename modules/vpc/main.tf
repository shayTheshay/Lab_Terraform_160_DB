resource "aws_vpc" "main_vpc"{
  cidr_block = var.cidr
  tags = var.vpc_tags
}