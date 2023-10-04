terraform {
  backend "s3" {
    bucket = "Parameters state file"
    key    = "params/terraform.tfstate"
    region = "us-east-1"
  }
}