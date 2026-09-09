resource "dbtcloud_project" "solaz_project" {
  name                     = "Solaz Data Transformation"
  description              = "dbt project for Solaz data transformations"
  dbt_project_subdirectory = "solaz_dbt"
}