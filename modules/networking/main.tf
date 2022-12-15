data "aws_availability_zones" "available"{
  state = "available"
}

// vpc resource block

resource "aws_vpc" "dev_vpc" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  # tags = merge({
  #   Envirenment = var.environment 
  #   Build_By = var.buildby
  #     })
}
resource "aws_subnet" "pub-snet" {
  vpc_id                = aws_vpc.dev_vpc.id
  cidr_block            = var.pub-cidr
  availability_zone     = var.pub-region
  
}
############
# PVT-SUBNET
############
resource "aws_subnet" "pri-snet" {
  vpc_id                = aws_vpc.dev_vpc.id
  for_each              = var.pri-snet
  cidr_block            = each.value["cidr_block"]
  availability_zone     = each.value["availability_zone"]

    #  tags = merge({
    # Envirenment = var.environment 
    # BuildBy = var.buildby
    #   })
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev_vpc.id

  # tags = {
  #   Name = "{var.app_name}-${terraform.workspace}-igw"
  #   env = "${terraform.workspace}"
  # }
}

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

# tags ={
#   Name = "${terraform.workspace}-pub-rt"
#   env ="${terraform.workspace}"
# }
}


resource "aws_route_table_association" "pub-rt-association" {
  subnet_id      = aws_subnet.pub-snet.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_eip" "eip" {
  for_each = aws_subnet.pri-snet
  tags = {
    Name = "gw NAT"
  }
  depends_on = [
    aws_subnet.pri-snet
  ]
}

resource "aws_nat_gateway" "nat-gt" {
  for_each = aws_eip.eip
  allocation_id = each.value.id
  #subnet_id = lookup(aws_subnet.pub-snet, var.nat-pub-id , null)
  subnet_id = aws_subnet.pub-snet.id
    tags = {
    Name = "gw NAT"
  }

 depends_on = [aws_internet_gateway.igw,aws_eip.eip]
}
resource "aws_route_table" "private" {
  for_each = aws_nat_gateway.nat-gt
  vpc_id = aws_vpc.dev_vpc.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = each.value.id
  }
}
resource "aws_route_table_association" "pri-rt-association" {
  for_each = aws_subnet.pri-snet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}
