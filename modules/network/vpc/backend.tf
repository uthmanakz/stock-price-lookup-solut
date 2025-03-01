terraform {
    backend "s3" {
        bucket = "uthman-project-bucket"
        key = "env/vpc/terraform.tfstate"
        region = "eu-west-2"
        use_lockfile = true
    }
}