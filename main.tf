# Call VPC from module
module "vpc" {
  source = "./modules/vpc"
  vpc_id = var.vpc_id
}

# Call Subnet group - in this assignment also creates the subnets
# This is an assingment that has specifically the files located like this.
module "subnet_group" {
  source = "./modules/db_subnet_group"  
  vpc_id = module.vpc.vpc_id
}

# Call the Database 
module "db" {
  source = "./modules/rds"
  
  
}
