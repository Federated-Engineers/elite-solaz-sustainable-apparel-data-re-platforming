# Orders table comes from Google Sheets

resource "snowflake_table" "orders" {
  database = module.prod_database.database_name
  schema   = module.prod_database.schema_names["BRONZE"]
  name     = "ORDERS"


  column {
    name = "TRANSACTION_ID"
    type = "VARCHAR"
  }

  column {
    name = "SKU_ID"
    type = "VARCHAR"
  }

  column {
    name = "CUSTOMER_ID"
    type = "VARCHAR"
  }

  column {
    name = "TRANSACTION_TIMESTAMP"
    type = "TIMESTAMP_NTZ"
  }

  column {
    name = "SALES_CHANNEL"
    type = "VARCHAR"
  }

  column {
    name = "UNITS_SOLD"
    type = "NUMBER(8,0)"
  }

  column {
    name = "GROSS_REVENUE_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "PROMOTIONAL_DISCOUNT_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "SHRINKAGE_WRITEOFF_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "NET_REVENUE_EUR"
    type = "NUMBER(10,2)"
  }

  column {
    name = "NOTES"
    type = "VARCHAR"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_NTZ"
  }
}
