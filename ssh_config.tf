resource "local_file" "ssh_config" {
  filename = "${path.module}/ssh_config_tp15"
  content  = <<-EOT
    Host tp-15-bastion
        HostName ${aws_instance.bastion.public_ip}
        User ec2-user
        IdentityFile ${abspath("${path.module}/tp-15-cle.pem")}

    Host tp-15-app
        HostName ${aws_instance.app.private_ip}
        User ec2-user
        IdentityFile ${abspath("${path.module}/tp-15-cle.pem")}
        ProxyJump tp-15-bastion
  EOT
}