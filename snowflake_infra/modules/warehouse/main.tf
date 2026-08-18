resource "snowflake_warehouse" "compute" {
  name           = var.compute_name
  warehouse_size = "X-SMALL"

  auto_suspend = 1200
  auto_resume  = true

  initially_suspended = true
  comment             = "Warehouse for ${var.compute_name}"
}
