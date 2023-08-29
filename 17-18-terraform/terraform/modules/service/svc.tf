resource "kubernetes_service" "this" {
    count = var.create ? 1 : 0
    metadata {
        name   = var.svc_name
        labels = var.svc_labels
        namespace = var.svc_ns
    }
    spec {
        selector = var.svc_selector
        
        port {
            port        = var.svc_port
            target_port = var.svc_target_port
        }

        type = var.svc_type
    }
}
