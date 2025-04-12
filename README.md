# aws-terraform-state

IaC for setup S3 bucket and DynamoDB as Terraform states

## Setup

1. Rename the `backend.tf` as `backend.tf.bk` in the beginning.
2. Setup `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` which having s3 and dynamodb creating permissions.
3. Run `terraform init`
4. Run `terraform plan -out tf.plan`
5. Run `terraform apply "tf.plan"`
6. Rename `backend.tf.bk` back to `backend.tf`
7. Update the `bucket` and `dynamodb_table` to align with previous created resources.
8. Run `terraform init` again and input `yes` to migrate state from local to remote.
