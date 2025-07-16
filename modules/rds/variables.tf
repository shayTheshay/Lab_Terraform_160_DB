variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 10
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default     = "mydb"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = "foo"
}

variable "password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
  default     = "foobarbaz"
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = "default.mysql8.0"
}

variable "skip_final_snapshot" {
  description = "Whether to skip taking a final DB snapshot before deleting the instance"
  type        = bool
  default     = true
}
