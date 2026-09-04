terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
      version = "1.12.5"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "6.51.0"
    }

  }
}

provider "dbtcloud" {
  account_id = var.dbt_cloud_account_id
  host_url   = var.dbt_cloud_host_url
  token      = data.aws_ssm_parameter.dbt_cloud_token.value
}

provider "aws" {
  region = "eu-central-1"
}
