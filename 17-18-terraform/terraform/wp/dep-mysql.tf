resource "kubernetes_deployment" "mysql-dep" {
    metadata {
        name      = "mysql"
        labels    = local.labels
        namespace = kubernetes_namespace.wp-ns.0.metadata[0].name
    }

    spec {
        replicas = 1

        selector {
            match_labels = {
                app = "mysql"
            }
        }

        template {
            metadata {
                labels = {
                    app = "mysql"
                }
            }

            spec {
                container {
                    image = var.myslq_image
                    name  = "mysql"
                    env_from {
                        secret_ref {
                            name = "mysql-pass-secret"
                        }
                    }
                    volume_mount {
                        mount_path = "/var/lib/mysql"
                        name = "db-data"
                    }
                }
                volume {
                    name = "db-data"
                    persistent_volume_claim {
                        claim_name = "pvc-mysql"
                    }
                }

            }
        }
    }
}