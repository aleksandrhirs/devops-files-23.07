variable "svc_name" {
    description = "Service name"
    type = string
    default = "demo-service"
}
variable "svc_labels" {}
variable "svc_ns" {}
variable "svc_selector" {}
variable "svc_port" {}
variable "create" {
    default = true
}
variable "svc_target_port" {}
variable "svc_type" {}
