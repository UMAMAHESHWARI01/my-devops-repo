variable "vpc_cidr_block" {
  type = string
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type = string
  description = "CIDR block for the public subnet"
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr_block" {
  type = string
  description = "CIDR block for the private subnet"
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type = string
  description = "Availability zone for the VPC resources"
  default = "eu-north-1a"
}

variable "web_server_ami" {
  type = string
  description = "AMI for the web server instances"
}

variable "app_server_ami" {
  type = string
  description = "AMI for the app server instances"
}

variable "web_server_security_group_ingress_cidr_block" {
  type = string
  description = "CIDR block allowed inbound traffic to the web server security group"
  default = "0.0.0.0/0"
}

variable "app_server_security_group_ingress_cidr_block" {
  type = string
  description = "CIDR block allowed inbound traffic to the app server security group"
  default = "0.0.0.0/0"
}

variable "instance_type" {
  type = string
  description = "Instance type for web and app servers"
  default = "t3.micro"
}