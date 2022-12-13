 
 resource "aws_instance" "server-1" {
  subnet_id     = var.sub-id
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [var.sg]
  key_name = var.key-pair
  iam_instance_profile = var.iam_instance_profile
  user_data = file("${path.module}/server-1.sh")



#  tags =  merge({
#     Envirenment = var.environment 
#     BuildBy = var.buildby
    
#   })
 } 

 resource "aws_instance" "server-2" {
  subnet_id     = var.sub-server2-id
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [var.sg2]
  key_name = var.key-pair
  iam_instance_profile = var.iam_instance_profile
  user_data = file("${path.module}/server-2.sh")



#  tags =  merge({
#     Envirenment = var.environment 
#     BuildBy = var.buildby
    
#   })

 } 

# data "template_file" "wpconfig" {
#   template = file("files/wp-config.php")

#   vars = {
#     #db_port = aws_db_instance.database-1.port
#     db_host = aws_instance.server-1.private_ip
#     db_user = "admin"
#     db_pass = "admin"
#     db_name = "my_db"
#   }
# }


#  resource "tls_private_key" "web-key" {
#   algorithum = "RSA"
# }

# resource "aws_key_pair" "frontend-key" {
#   key_name = "web-key"
#   public_key = tls_private_key.web-key.public_key_openssh  
# }
#  resource "local_file" "web-key" {
#   content = tls_private_key.web-key.private_key_pem
#   filename = "web-key.pem"   
#  }

# provisioner "remote-exec" { #install apache, mysql client, php
# inline = [
# "sudo mkdir -p /var/www/html/",
# "sudo yum update -y",
# "sudo yum install -y httpd",
# "sudo service httpd start",
# "sudo usermod -a -G apache ec2-user",
# "sudo chown -R ec2-user:apache /var/www",
# "sudo yum install -y mysql php php-mysql"
# ]
# }
# provisioner "file" { #copy the index file form local to remote
# source = "index.php"
# destination = "/var/www/html/index.php"
# }
# connection {
# type = "ssh"
# user = "ec2-user"
# password = ""
# #copy .pem to your local instance home directory
# #restrict permission: chmod 400 .pem
# private_key = "${file("/home/ec2-user/.pem")}"
# }

# locals {
#   cloud_config_config = <<-END
#     #cloud-config
#     ${jsonencode({
#       write_files = [
#         {
#           path        = "/etc/example.txt"
#           permissions = "0644"
#           owner       = "root:root"
#           encoding    = "b64"
#           content     = filebase64("${path.module}/example.txt")
#         },
#       ]
#     })}
#   END
# }
# user_data = data.cloudinit_config.example.rendered