# Transfer ownership of external tables from Atlantis User to Airflow User
# so Airflow can refresh external tables without running into permission issues.
# using the command ALTER EXTERNAL TABLE SOLAZ_PROD_DB.BRONZE."rfid_scans" REFRESH;


resource "snowflake_grant_ownership" "transfer_ownership_to_airflow" {
  account_role_name = snowflake_account_role.airflow.name

  on {
    object_type = "EXTERNAL TABLE"
    object_name = snowflake_external_table.rfid_scans.fully_qualified_name
  }

  outbound_privileges = "COPY"
}

resource "snowflake_grant_privileges_to_account_role" "airflow_use_stage" {
  account_role_name = snowflake_account_role.airflow.name
  privileges        = ["USAGE"]

  on_schema_object {
    object_type = "STAGE"
    object_name = snowflake_stage_external_s3.stage.fully_qualified_name
  }
}
