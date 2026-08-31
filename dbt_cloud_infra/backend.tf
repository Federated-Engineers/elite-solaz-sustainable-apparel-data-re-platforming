terraform {
  backend "s3" {
    bucket = "federated-engineers-production-elite-solaz-tfstate"
    key    = "dbt-cloud/terraform.tfstate"
    region = "eu-central-1"
  }
}

