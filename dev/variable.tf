variable "cidr" {
  description = " The desired CIRD range of VPC"
}
variable "cidr2" {
  description = " The desired CIRD range of VPC"
}
variable "pri-snet" {
  description = "Desired Public Subnet Ranges"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}
variable "pri-snet2" {
  description = "Desired Public Subnet Ranges"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

# variable "vpc" {
#   type = map(map(object({
#   cidr = string
#   pri-snet = {
#     cidr_block        = string
#     availability_zone = string
#   }
#   })))
# }
variable "pub-cidr" {
  
}
variable "pub-region" {
  
}
variable "pub-cidr2" {
  
}
variable "pub-region2" {
  
}