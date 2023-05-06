terraform {
  backend "s3" {
    bucket  = "paroson-tfstate"
    key     = "dev-sbcntr/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "default"
  }
}
