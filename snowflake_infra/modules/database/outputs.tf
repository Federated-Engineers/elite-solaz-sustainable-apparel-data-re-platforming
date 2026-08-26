output "database_name" {
  value = snowflake_database.db.name
}

output "schema_names" {
  value = {
    for key, schema in snowflake_schema.schemas :
    key => schema.name
  }
}