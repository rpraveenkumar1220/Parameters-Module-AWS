terraform {
  backend "s3" {
    bucket = "Parameters_state_file"
    key    = "params/terraform.tfstate"
    region = "us-east-1"
  }
}