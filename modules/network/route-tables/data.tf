data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "uthman-project-bucket"
    key    = "env/vpc/terraform.tfstate"
    region = "eu-west-2"
  }
}