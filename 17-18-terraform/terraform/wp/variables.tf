variable "wp_svc_port" {
    type = number
    default = 8070
}

variable "create" {
    default = true
}

variable "wp_image" {
    type = string
    default = "wordpress"
}

variable "dbuser" {
    type = string
}
variable "dbpassword" {
    type = string
}

variable "myslq_image" {}
variable "env" {}
variable "app_name" {}