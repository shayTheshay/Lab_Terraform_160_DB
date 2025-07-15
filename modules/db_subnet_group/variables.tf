############################ IDENTITY

variable "vpc_id" {
  description = "ID of the Lab VPC"
  type = string
}

############################ AVAILABILITY ZONES
variable "availability_zone_subnet_frontend" {
  description = "The cidr for frontend"
  type = string
  default = "us-west-2a"
}
variable "availability_zone_subnet_backend" {
  description = "The cidr for backend"
  type = string
  default = "us-west-2b"
}

############################ CIDR BLOCKS

variable "frontend_subnet_cidr_block" {
  description = "The cidr for frontend"
  type = string
  default = "10.0.0.0/24" 
}

variable "backend_subnet_cidr_block" {
  description = "The cidr for backend"
  type = string
  default = "10.0.1.0/24"
}

############################ NAME

variable "subnet_group_name" {
  description = "The name of the subnet group"
  type = string
  default = "main_db_subnet_group"
}


############################ TAGS

variable "subnet_group_tags" {
    description = "The tags of the subnet group"
    type = map(string)
    default = {
      name = "My DB subnet group"
    }
}

variable "backend_subnet_tags" {
  description = "The Tags for backend"
  type = map(string)
  default = {
    name = "tf-dbsubnet-test-2"
  }  
}
variable "frontend_subnet_tags" {
  description = "The Tags for frontend"
  type = map(string)
  default = {
    name = "tf-dbsubnet-test-1"
  }  
}