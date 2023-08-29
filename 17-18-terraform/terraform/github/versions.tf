terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "5.33.0"
        }
    }
}

provider "github" {
    token = var.tf_token
}


data "terraform_remote_state" "wp-data" {
    backend = "kubernetes"
    config  = {
        secret_suffix    = "wp-state"
        load_config_file = true
        config_path      = "~/.kube/config"
        namespace        = "kube-system"
    }
}
