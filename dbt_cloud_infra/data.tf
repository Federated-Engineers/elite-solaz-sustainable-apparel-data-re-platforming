data "aws_ssm_parameter" "dbt_cloud_token" {
  name = "/production/elite/dbt/solaz/dbt_cloud_terraform_token"
}

data "aws_ssm_parameter" "ecs_user_password" {
  name = "/production/elite/snowflake/kings_county/ecs_user_password"
}


# Read dbt_cloud's snowflake credentials using remote state
data "terraform_remote_state" "snowflake_prod_tfstate" {
  backend = "s3"

  config = {
    bucket = "federated-engineers-production-elite-solaz-tfstate"
    key    = "production/terraform.tfstate"
    region = "eu-central-1"
  }
}
