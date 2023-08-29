resource "kubernetes_persistent_volume_claim" "mysql-pvc" {
    metadata {
        name = "pvc-mysql"
        namespace = kubernetes_namespace.wp-ns.0.metadata[0].name
    }
    spec {
        access_modes = ["ReadWriteMany"]
        resources {
            requests = {
                storage = "1Gi"
            }
        }
    }
}

resource "kubernetes_persistent_volume_claim" "wp-pvc" {
    metadata {
        name = "pvc-wp"
        namespace = kubernetes_namespace.wp-ns.0.metadata[0].name
    }
    spec {
        access_modes = ["ReadWriteMany"]
        resources {
            requests = {
                storage = "1Gi"
            }
        }
    }
}
