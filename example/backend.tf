
# You can not use variables in this block, all values should be "hard-coded"
terraform {
  backend "s3" {
    bucket         = "customer-tfstates"        # output of the command 'terraform output s3_bucket'
    key            = "customer/project.tfstate" # path to the state file - change according to the project - customer/project.tfstate
    region         = "us-east-1"
    dynamodb_table = "customer-terraform-state-locking" # output of the command 'terraform output dynamodb_table_name'
    encrypt        = true
  }
}
