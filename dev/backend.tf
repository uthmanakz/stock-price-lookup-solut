terraform {
    backend "s3" {
    bucket = "uthman-project-bucket"
    key    = "env/dev/terraform.tfstate"
    region = "eu-west-2"
    }
}