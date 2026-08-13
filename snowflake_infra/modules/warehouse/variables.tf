variable "wh_name" {
  type = string
}

output "wh_name" {
  value = snowflake_warehouse.wh.name
}