terraform {
  backend "s3" {
    bucket         = "huaweic-tf-state"
    key            = "terraform-state.tfstate"
    region         = "us-west-2"
    dynamodb_table = "huaweic-tf-lock"
  }
}
