output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "public_subnet_2a_id" {
    value = aws_subnet.public_subnet_2a.id
}

output "public_subnet_2b_id" {
    value = aws_subnet.public_subnet_2b.id
}

output "igw_id" {
    value = aws_internet_gateway.igw.id
}