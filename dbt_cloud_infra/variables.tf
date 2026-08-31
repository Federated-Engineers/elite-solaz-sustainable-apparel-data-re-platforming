variable "dbt_cloud_account_id" {
  type      = number
  default   = 70506183159178
  sensitive = true
}

variable "dbt_cloud_host_url" {
  type      = string
  default   = "https://tg883.us1.dbt.com/api"
  sensitive = true
}

variable "snowflake_account" {
  type    = string
  default = "MGGTAJQ-OX61727"
}

variable "snowflake_prod_database" {
  type    = string
  default = "SOLAZ_PROD_DB"
}

variable "snowflake_service_compute" {
  type    = string
  default = "SOLAZ_PROD_SERVICE_COMPUTE"
}

variable "num_threads" {
  type    = number
  default = 8
}

variable "dbt_version" {
  type    = string
  default = "latest"
}
