resource "dbtcloud_job" "slim_ci_job" {
  project_id     = dbtcloud_project.solaz_project.id
  environment_id = dbtcloud_environment.slim_ci.environment_id

  name = "PR validation of dbt models"

  execute_steps = [
    "dbt build -s state:modified+ --fail-fast"
  ]

  deferring_environment_id = dbtcloud_environment.production.environment_id

  generate_docs        = false
  run_generate_sources = false
  triggers_on_draft_pr = false

  triggers = {
    github_webhook       = false
    git_provider_webhook = true
    schedule             = false
    on_merge             = false
  }

  execution = {
    timeout_seconds = 3600
  }
}


resource "dbtcloud_job" "production_job" {
  project_id     = dbtcloud_project.solaz_project.id
  environment_id = dbtcloud_environment.prod.environment_id

  name = "Production Build"

  execute_steps = [
    "dbt build"
  ]

  generate_docs        = true
  run_generate_sources = false

  triggers = {
    github_webhook       = false
    git_provider_webhook = false
    schedule             = false
    on_merge             = true
  }

  execution = {
    timeout_seconds = 3600
  }
}