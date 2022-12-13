module "vpc1" {
  
  source          = "../modules/networking"
  cidr            = var.cidr
  pri-snet        = var.pri-snet
  pub-cidr = var.pub-cidr
  pub-region = var.pub-region
  is_nat_required = true
  
}

module "vpc2" {
  source          = "../modules/networking"
  cidr            = var.cidr2
  pri-snet        = var.pri-snet2
  pub-cidr = var.pub-cidr2
  pub-region = var.pub-region2
  is_nat_required = true

}


resource "aws_ec2_transit_gateway" "gateway" {
  description = "my-tg"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "first-vpc" {
  subnet_ids         = [lookup(module.vpc1.pri-snet-id,"ps1",null)]
  transit_gateway_id = aws_ec2_transit_gateway.gateway.id
  vpc_id             = module.vpc1.vpc-id
}
resource "aws_ec2_transit_gateway_vpc_attachment" "second-vpc" {
  subnet_ids         = [lookup(module.vpc2.pri-snet-id,"ps1",null)]
  transit_gateway_id = aws_ec2_transit_gateway.gateway.id
  vpc_id             = module.vpc2.vpc-id
}
resource "aws_route_table" "tg-vpc1" {
  route = {
    cidr_block= module.vpc1.cidr_block
    gateway_id = aws_ec2_transit_gateway.gateway
  } 
}
resource "aws_route_table" "tg-vpc2" {
  route = {
    cidr_block= module.vpc2.cidr_block
    gateway_id = aws_ec2_transit_gateway.gateway
  } 
}