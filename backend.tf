terraform {
  backend "s3" {
    bucket = "s2-today-13159"
    key    = "sept28.tfstate"
    region = "us-east-1"
  }
}