
 resource "aws_instance" "node" {
    ami = "ami-00710ab5544b60cf7"
    instance_type = "t2.micro"
    key_name = "simbababy"
    subnet_id = var.subnet_id

    tags = {
        Name = var.tag_name
        dev = var.dev_value
    }
}