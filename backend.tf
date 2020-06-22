terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "kaedemalu" # 現在のOrganizantion Name
 
    workspaces {
      name = "terraform_101_handon" # 使っているWorkspaceの名前
    }
  }
}