output "vpc_id" {
  value = aws_vpc.vpcforpra.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value = aws_subnet.public.id
  description = "The ID of the public subnet"
}

output "private_subnet_id" {
  value = aws_subnet.private.id
  description = "The ID of the private subnet"
}

output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
  description = "The public IP address of the web server instance"
}

# Consider adding an output for app server private IP if needed
# output "app_server_private_ip" {
#   value = aws_instance.app_server.private_ip
#   description = "The private IP address of the app server instance"
# }