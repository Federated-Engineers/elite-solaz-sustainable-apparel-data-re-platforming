resource "snowflake_user" "user" {
  name         = var.user_name
  display_name = var.user_name

  password = var.password

  disabled          = false
  default_role      = var.default_role
  default_warehouse = var.default_warehouse

  must_change_password = false
}
