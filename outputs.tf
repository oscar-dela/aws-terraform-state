output "terraform_state_bucket_name" {
  value       = aws_s3_bucket.terraform_state.bucket
  description = "The name of the S3 bucket used for Terraform state"
}

output "terraform_state_lock" {
  value       = aws_dynamodb_table.terraform_state_lock.name
  description = "The name of the DynamoDB table used for state locking"
}
