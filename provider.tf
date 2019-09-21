provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.customer}"
}

terraform {
  required_version = ">= 0.12.0"
  backend "local" {
    path = "terraform.tfstate"
  }
}