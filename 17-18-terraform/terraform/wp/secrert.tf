resource "kubernetes_secret" "mysql-pass" {
    metadata {
        name = "mysql-pass-secret"
        namespace = kubernetes_namespace.wp-ns.0.metadata[0].name
    }

    data = {
        MYSQL_ROOT_PASSWORD = var.dbpassword
        MYSQL_PASSWORD = var.dbpassword
        MYSQL_USER = var.dbuser
        MYSQL_DATABASE = "demodb"
    }

    type = "Opaque"
}