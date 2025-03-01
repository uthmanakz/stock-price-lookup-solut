resource "aws_route_table" "public_subent_RT" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.vpc.outputs.igw_id
  }
}