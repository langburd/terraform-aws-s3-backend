output "s3_bucket" {
  value = "${aws_s3_bucket.terraform_state_s3_bucket.bucket}"
}

output "dynamodb_table_name" {
  value = "${aws_dynamodb_table.terraform_state_locking_dynamodb.name}"
}

