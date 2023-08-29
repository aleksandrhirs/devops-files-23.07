variable "tf_token" {
    sensitive = true
    type = string
}

variable "files" {
    default = [
        "output.tf",
        "svc.tf",
        "variables.tf"
    ]
}