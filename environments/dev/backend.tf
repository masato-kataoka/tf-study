terraform {
  backend "s3" {
    bucket = "paroson-tfstate"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-1"
    profile = "default"
  }
}
