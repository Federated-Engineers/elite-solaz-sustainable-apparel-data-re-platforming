module "dev_database" {
  source = "../modules/database"

  database_name = "SOLAZ_DEV_DB"
  schema_name   = ["SILVER", "GOLD"]
}