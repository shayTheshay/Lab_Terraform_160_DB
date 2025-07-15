variable "vpc_id" {
  description = "The id of the vpc for the lab"
  type = string   
}


variable "region" {
  description ="AWS region to deploy infastracture"  
  type = string
  default = "us-west-2"
}
