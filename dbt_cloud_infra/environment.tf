resource "dbtcloud_environment" "prod" {
  name            = "Production"
  project_id      = dbtcloud_project.solaz_project.id
  type            = "deployment"
  deployment_type = "production"

  connection_id = dbtcloud_global_connection.dbt_cloud_snowflake_connection.id
  credential_id = dbtcloud_snowflake_credential.dbt_cloud_snowflake_credentials.id

  dbt_version = var.dbt_version
}

resource "dbtcloud_environment" "slim_ci" {
  name            = "Slim CI"
  project_id      = dbtcloud_project.solaz_project.id
  type            = "deployment"
  deployment_type = "staging"

  connection_id = dbtcloud_global_connection.dbt_cloud_snowflake_connection.id
  credential_id = dbtcloud_snowflake_credential.slim_ci_snowflake_credentials.id

  dbt_version = var.dbt_version
}