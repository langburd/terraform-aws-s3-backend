provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.customer}"
}

terraform {
  backend "local" {
    path = "${var.customer}.tfstate"
  }
}