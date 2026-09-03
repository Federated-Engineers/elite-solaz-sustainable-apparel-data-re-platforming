resource "dbtcloud_repository" "github_repo" {
  project_id = dbtcloud_project.solaz_project.id

  remote_url             = "git@github.com:Federated-Engineers/elite-solaz-sustainable-apparel-data-re-platforming.git"
  github_installation_id = "150067907"
  git_clone_strategy     = "github_app"
}

resource "dbtcloud_project_repository" "project_repository" {
  project_id    = dbtcloud_project.solaz_project.id
  repository_id = dbtcloud_repository.github_repo.repository_id
}