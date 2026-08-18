variable "compute_name" {
  type = string
}

output "compute_name" {
  value = snowflake_warehouse.compute.name
}