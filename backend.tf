terraform {
  backend "gcs" {
    bucket = "tandigital-bucket"
    prefix = "tfstate/tan-infra"
  }
}
