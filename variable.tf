# vpc variables
variable "vpc_cidr" {
  default       = "10.0.0.0/16"
  description   = "vpc cidr block"
  type          = string
}

variable "public_subnet_az1_cidr" {
  default       = "10.0.0.0/24"
  description   = "public subnet az1 cidr block"
  type          = string
}

variable "public_subnet_az2_cidr" {
  default       = "10.0.1.0/24"
  description   = "public subnet az2 cidr block"
  type          = string
}

variable "private_app_subnet_az1_cidr" {
  default       = "10.0.2.0/24"
  description   = "private app subnet az1 cidr block"
  type          = string
}

variable "private_app_subnet_az2_cidr" {
  default       = "10.0.3.0/24"
  description   = "private app subnet az2 cidr block"
  type          = string
}

variable "private_data_subnet_az1_cidr" {
  default       = "10.0.4.0/24"
  description   = "private data subnet az1 cidr block"
  type          = string
}

variable "private_data_subnet_az2_cidr" {
  default       = "10.0.5.0/24"
  description   = "private data subnet az2 cidr block"
  type          = string
}

# Security group variables
variable "ssh_location" {
  default       = "0.0.0.0/0"
  description   = "ssh the ip address that can ssh into the ec2 instances"
  type          = string
}

#rds variables
#variable "database_snapshot_identifier" {
  #default       = "snapshot"
  #description   = "The database snapshot arn"\
  #type          = string
#}

variable "database_instance_class" {
  default       = "db.t2.micro"
  description   = "The database instance type"
  type          = string
}

#variable "database_isntance_identifier" {
  #default       = "dev-rds-db"
  #description   = "The database instance identifier"
  #type          = string
#}

variable "multi_az_deployment" {
  default       = false
  description   = "create a standby db instance"
  type          = bool
}

# application load balancer variables
variable "ssl_certificate_arn" {
  default       = "arn:aws:acm:us-east-1:204694930892:certificate/e2d79599-1835-405d-9137-1ce9a6366318"
  description   = "ssl certificate arn"
  type          = string
}