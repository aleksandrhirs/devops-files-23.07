resource "local_file" "ansible_inventory" {
    content = templatefile("ansible_inv.tpl",
        {vm_ip_address = data.terraform_remote_state.wp-data.outputs.mysql_ip,
          private_ssh_key = "/home/vagrant/.ssh/id_rsa"
        })
    filename = "./inventory"     
}


# resource "null_resource" "run_ansible" {
  
#     provisioner "local-exec" {
#         command = "ansible-playbook -i inventory playbook.yml"   
#     }

# }

resource "null_resource" "docker_build" {
  
    provisioner "local-exec" {
        command = <<-EOT
            echo ${var.tf_token}| docker login -u fenikks ghcr.io --password-stdin
            docker build -t ghcr.io/fenikks/wcg-test -f Dockerfile.multi .
            docker push ghcr.io/fenikks/wcg-test
        EOT
    }
    triggers = {
        #run_always = timestamp()
        docker_file = md5(file("Dockerfile.multi"))
    }
}