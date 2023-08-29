module "svc-mysql" {
    count = var.create ? 1 : 0
    source = "git::https://github.com/Fenikks/tf-modules.git//service"

    svc_name   = "mysql-svc"
    svc_labels = local.labels
    svc_ns     = kubernetes_namespace.wp-ns[count.index].metadata[0].name
    svc_selector = {
        app = "mysql"
    }
    svc_port = 3306
    svc_target_port = 3306
    svc_type = "ClusterIP"
}

module "svc-wp" {
    count = 1
    source = "git::https://github.com/Fenikks/tf-modules.git//service"

    svc_name   = "wp-svc"
    svc_labels = local.labels
    svc_ns     = kubernetes_namespace.wp-ns[count.index].metadata[0].name
    svc_selector = {
        app = "wp"
    }
    svc_port = var.wp_svc_port
    svc_target_port = 80
    svc_type = "ClusterIP"
}
