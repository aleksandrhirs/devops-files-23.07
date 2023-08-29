resource "kubernetes_deployment" "wp-dep" {
    metadata {
        name      = "wp"
        labels    = local.labels
        namespace = kubernetes_namespace.wp-ns.0.metadata[0].name
    }

    spec {
        replicas = 1

        selector {
            match_labels = {
                app = "wp"
            }
        }

        template {
            metadata {
                labels = {
                    app = "wp"
                }
            }

            spec {
                container {
                    image = var.wp_image
                    name  = "wordpress"
                    env {
                        name = "WORDPRESS_DB_USER"
                        value_from {
                            secret_key_ref {
                                name = "mysql-pass-secret"
                                key  = "MYSQL_USER"
                            }
                        }
                    }

                    env {
                        name = "WORDPRESS_DB_PASSWORD"
                        value_from {
                            secret_key_ref {
                                name = "mysql-pass-secret"
                                key  = "MYSQL_PASSWORD"
                            }
                        }
                    }

                    env {
                        name = "WORDPRESS_DB_NAME"
                        value_from {
                            secret_key_ref {
                                name = "mysql-pass-secret"
                                key  = "MYSQL_DATABASE"
                            }
                        }
                    }
                    env {
                        name = "WORDPRESS_DB_HOST"
                        value = "mysql-svc"
                    }

                    volume_mount {
                        mount_path = "/var/www/html"
                        name = "wp-data"
                    }
                }
                volume {
                    name = "wp-data"
                    persistent_volume_claim {
                        claim_name = "pvc-wp"
                    }
                }

            }
        }
    }
}