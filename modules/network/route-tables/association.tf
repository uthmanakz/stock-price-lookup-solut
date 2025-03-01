resource "aws_route_table_association" "public_subnet_RT_association_2a" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.public_subnet_2a_id
  route_table_id = aws_route_table.public_subent_RT.id
}

resource "aws_route_table_association" "public_subnet_RT_association_2b" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.public_subnet_2b_id
  route_table_id = aws_route_table.public_subent_RT.id
}