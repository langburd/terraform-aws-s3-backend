variable "region" {
  default = "us-east-1"
}

# Path to the file with AWS credentials created after running 'aws configure --profile <customer name>'
variable "shared_credentials_file" {
  default = "~/.aws/credentials"
}

# name of credentials profile in '~/.aws/credentials' file
variable "customer" {
  default = "customer"
}