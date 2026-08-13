resource "snowflake_database" "db" {
  name      = var.database_name
  log_level = "INFO"
  comment   = "Production database"
}

resource "snowflake_schema" "schemas" {
  for_each = var.schema_name

  database = snowflake_database.db.name
  name     = each.value
  comment  = "${each.value} schema in ${var.database_name}"
}
