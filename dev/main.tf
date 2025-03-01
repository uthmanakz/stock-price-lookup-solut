provider "aws"{
    region = "eu-west-2"
}

module "ansible" {
    source = "../modules/ec2"
    vpc_sg_id = data.terraform_remote_state.vpc.outputs.vpc_id
    subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_2a_id
    tag_name = "ANSIBLE"
    dev_value = "ansible"
    sg_id = [aws_security_group.ansible_sg.id]
}

module "web_2a" {
    source = "../modules/ec2"
    vpc_sg_id = data.terraform_remote_state.vpc.outputs.vpc_id
    subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_2a_id
    tag_name = "WEB-2A"
    dev_value = "web"
    sg_id = [aws_security_group.ansible_sg.id]

}

module "web_2b" {
    source = "../modules/ec2"
    vpc_sg_id = data.terraform_remote_state.vpc.outputs.vpc_id
    subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_2b_id
    tag_name = "WEB-2B"
    dev_value = "web"
    sg_id = [aws_security_group.ansible_sg.id]

}

module "app_2a" {
    source = "../modules/ec2"
    vpc_sg_id = data.terraform_remote_state.vpc.outputs.vpc_id
    subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_2a_id
    tag_name = "APP-2A"
    dev_value = "app"
    sg_id = [aws_security_group.ansible_sg.id]

}

module "app_2b" {
    source = "../modules/ec2"
    vpc_sg_id = data.terraform_remote_state.vpc.outputs.vpc_id
    subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_2b_id
    tag_name = "APP-2B"
    dev_value = "app"
    sg_id = [aws_security_group.ansible_sg.id]

}

module "redis_2a" {
    source = "../modules/ec2"
    vpc_sg_id = data.terraform_remote_state.vpc.outputs.vpc_id
    subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_2a_id
    tag_name = "REDIS-2A"
    dev_value = "redis"
    sg_id = [aws_security_group.ansible_sg.id]

}

module "redis_2b" {
    source = "../modules/ec2"
    vpc_sg_id = data.terraform_remote_state.vpc.outputs.vpc_id
    subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_2b_id
    tag_name = "REDIS-2B"
    dev_value = "redis"
    sg_id = [aws_security_group.ansible_sg.id]

}

