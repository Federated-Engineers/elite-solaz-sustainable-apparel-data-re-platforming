resource "snowflake_external_table" "rfid_scans" {
  database = module.prod_database.database_name
  schema   = module.prod_database.schema_names["BRONZE"]
  name     = "rfid_scans"

  file_format = "FORMAT_NAME = ${snowflake_file_format.bronze_json_format.fully_qualified_name}"
  location    = "@${snowflake_stage_external_s3.stage.fully_qualified_name}/rfid_scans/"

  column {
    name = "scan_id"
    type = "VARCHAR"
    as   = "VALUE:scan_id::VARCHAR"
  }

  column {
    name = "sku_id"
    type = "VARCHAR"
    as   = "VALUE:sku_id::VARCHAR"
  }

  column {
    name = "facility_id"
    type = "VARCHAR"
    as   = "VALUE:facility_id::VARCHAR"
  }

  column {
    name = "scan_timestamp"
    type = "TIMESTAMP_NTZ"
    as   = "VALUE:scan_timestamp::DATETIME"
  }

  column {
    name = "scan_type"
    type = "VARCHAR"
    as   = "VALUE:scan_type::VARCHAR"
  }

  column {
    name = "rfid_tag_status"
    type = "VARCHAR"
    as   = "VALUE:rfid_tag_status::VARCHAR"
  }

  column {
    name = "YEAR"
    type = "NUMBER"
    as   = "SPLIT_PART(SPLIT_PART(METADATA$FILENAME, '/', 3), '=', 2)::NUMBER"
  }

  column {
    name = "MONTH"
    type = "NUMBER"
    as   = "SPLIT_PART(SPLIT_PART(METADATA$FILENAME, '/', 4), '=', 2)::NUMBER"
  }

  column {
    name = "DAY"
    type = "NUMBER"
    as   = "SPLIT_PART(SPLIT_PART(METADATA$FILENAME, '/', 5), '=', 2)::NUMBER"
  }

  partition_by = [
    "YEAR",
    "MONTH",
    "DAY"
  ]
}

