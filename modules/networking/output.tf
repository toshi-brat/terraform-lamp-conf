output "vpc-id" {
    value = aws_vpc.dev_vpc.id
}
output "cidr_block" {
  value = aws_vpc.dev_vpc.cidr_block
}
output "pri-snet-id" {
value = {for k,v in aws_subnet.pri-snet: k => v.id}
}