resource "snowflake_storage_integration_aws" "storage_integration" {
  name             = "SOLAZ_PROD_S3_STORAGE_INTEGRATION"
  enabled          = true
  storage_provider = "S3"

  storage_allowed_locations = ["s3://solaz-supplychain-lake/telemetry/"]
  storage_aws_role_arn      = "arn:aws:iam::049417293525:role/elite-snowflake-role"
}

resource "snowflake_stage_external_s3" "stage" {
  name                = "BRONZE_STAGE"
  database            = "SOLAZ_PROD_DB"
  schema              = "BRONZE"
  url                 = "s3://solaz-supplychain-lake/telemetry/"
  storage_integration = snowflake_storage_integration_aws.storage_integration.name
}

resource "snowflake_file_format" "bronze_json_format" {
  name        = "BRONZE_JSON_FORMAT"
  database    = "SOLAZ_PROD_DB"
  schema      = "BRONZE"
  format_type = "JSON"
}