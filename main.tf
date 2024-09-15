provider "aws" {
  region = "eu-north-1" # Replace with your desired AWS region
  access_key = "Your Access Key"
  secret_key = "Your secrete Access Key"
}

resource "aws_vpc" "vpcforpractice" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "practice-vpc"
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.vpcforpractice.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "eu-north-1a"
    tags = {
        Name = "public-subnet"
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.vpcforpractice.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-north-1a"
    tags = {
        Name = "private-subnet"
    }
}
resource "aws_internet_gateway" "example" {
    vpc_id = aws_vpc.vpcforpractice.id
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpcforpra.id
}

resource "aws_route" "public_internet_gateway" {
    route_table_id     = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
}

resource "aws_security_group" "web_server" {
    name = "web_server_sg"
    description = "Security group for web servers"
    vpc_id = aws_vpc.vpcforpractice.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "app_server" {
    name = "app_server_sg"
    description = "Security group for app servers"
    vpc_id = aws_vpc.vpcforpractice.id

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web_server" {
    ami           = "ami-*************" # Replace with a desired AMI
    instance_type = "t3.micro"
    subnet_id     = aws_subnet.public.id
    security_groups = [aws_security_group.web_server.id]
    tags = {
        Name = "web-server"
    }
}

resource "aws_instance" "app_server" {
    ami           = "ami-*************" # Replace with a desired AMI
    instance_type = "t3.micro"
    subnet_id     = aws_subnet.private.id
    security_groups = [aws_security_group.app_server.id]
    tags = {
        Name = "app-server"
    }
}