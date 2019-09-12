# Create KMS key for encrypting S3 bucket
resource "aws_kms_key" "terraform_kms_key" {
  description         = "Used to encrypt Terraform State bucket objects"
  enable_key_rotation = true
  tags = {
    Description = "Used to encrypt Terraform State bucket objects"
    Owner       = title("${var.customer}")
  }
}

# Create S3 bucket
resource "aws_s3_bucket" "terraform_state_s3_bucket" {
  bucket = lower("${var.customer}-tfstates")
  region = "${var.region}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.terraform_kms_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Description = "Terraform State Files Storage"
    Owner       = title("${var.customer}")
  }
}

# Create DynamoDB table for locking state file when running plan/apply
resource "aws_dynamodb_table" "terraform_state_locking_dynamodb" {
  name           = lower("${var.customer}-terraform-state-locking")
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Description = "Terraform State Files Locking"
    Owner       = title("${var.customer}")
  }
}
