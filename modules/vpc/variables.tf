variable "name" {
 description = "Name of the VPC"
 type = string
 default = "VPC_Default"
}

variable "cidr" {
 description = "cidr of the vpc"
 type = string
 default = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "ID of the Lab VPC"
  type = string
}

variable "vpc_tags" {
  description = "Use tags for identifying the vpc module"
  type = map(string)
  default = {
   Name = "terraform-vpc" 
  }
}