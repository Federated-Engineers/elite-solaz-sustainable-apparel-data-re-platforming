resource "snowflake_warehouse" "wh" {
  name           = var.wh_name
  warehouse_size = "X-SMALL"

  auto_suspend = 1200
  auto_resume  = true

  initially_suspended = true
  comment             = "Warehouse for ${var.wh_name}"
}