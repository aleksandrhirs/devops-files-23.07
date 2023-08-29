resource "github_repository" "modules" {
    name        = "tf-modules"
    description = "Terraform demo"
    visibility  = "public"
    auto_init   = true
}


resource "github_branch_default" "main"{
    repository = github_repository.modules.name
    branch     = "main"
    rename     = true
}

resource "github_repository_file" "file" {
    # count = length(var.files)
    for_each = fileset("${path.module}/../modules/service", "*.tf")

    repository          = github_repository.modules.name
    branch              = github_branch_default.main.branch
    # file                = "service/${element(var.files, count.index)}"
    # content             = file("${path.module}/../modules/service/${element(var.files, count.index)}")
    
    file                = "service/${each.value}"
    content             =  file("${path.module}/../modules/service/${each.value}")
    commit_message      = "Managed by Terraform"
    commit_author       = "Alina Freydina"
    commit_email        = "alina.freydina@gmail.com"
    overwrite_on_create = true
}


resource "github_repository_file" "file-tmp" {
    repository          = github_repository.modules.name
    branch              = github_branch_default.main.branch
    file                = "test.txt"
    content             = data.terraform_remote_state.wp-data.outputs.mysql_ip
    commit_message      = "Managed by Terraform"
    commit_author       = "Alina Freydina"
    commit_email        = "alina.freydina@gmail.com"
    overwrite_on_create = true
}