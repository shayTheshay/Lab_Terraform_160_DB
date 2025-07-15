resource "aws_subnet" "frontend" {
  cidr_block = var.frontend_subnet_cidr_block
  availability_zone = var.availability_zone_subnet_frontend
  vpc_id = var.vpc_id

  tags = var.frontend_subnet_tags
}


resource "aws_subnet" "backend" {
  cidr_block = var.backend_subnet_cidr_block
  availability_zone = var.availability_zone_subnet_backend
  vpc_id = var.vpc_id
  tags = var.backend_subnet_tags
}

resource "aws_db_subnet_group" "default" {
  name = var.subnet_group_name
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]
  tags = var.subnet_group_tags
}



