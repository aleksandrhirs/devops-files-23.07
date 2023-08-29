resource "kubernetes_namespace" "wp-ns" {
    count = var.create ? 1 : 0
    metadata {
        labels = local.labels
        name = "${local.prefix}-namespace"
    }
}