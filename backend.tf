terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "kaedemalu" # 現在のOrganizantion Name
 
    workspaces {
      name = "terraform_101" # 使っているWorkspaceの名前
    }
  }
}