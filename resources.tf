
locals {
  tags = {
    Project        = var.project_prefix
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.project_prefix}-tf-state"

  lifecycle {
    prevent_destroy = false
  }

  tags = local.tags
}

resource "aws_s3_bucket_ownership_controls" "terraform_state_ownership" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "${var.project_prefix}-tf-lock"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"

  tags = local.tags

}
