variable "database_name" {
  type = string
}

variable "schema_name" {
  type = set(string)
}

variable "comment" {
  type    = string
  default = ""
}