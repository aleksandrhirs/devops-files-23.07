terraform {
    required_providers {
        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "2.23.0"
        }
    }

    backend "kubernetes" {
        secret_suffix    = "wp-state"
        config_path      = "~/.kube/config"
        namespace        = "kube-system"
    }

}

provider "kubernetes" {
    config_path = "~/.kube/config"
}

