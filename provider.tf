provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials" # path to the file with AWS credentials created after running 'aws configure --profile <customer name>'
  profile                 = "${var.customer}"    # name of credentials profile in '~/.aws/credentials' file
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}