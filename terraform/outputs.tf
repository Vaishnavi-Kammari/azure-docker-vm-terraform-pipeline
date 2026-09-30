output "public_ip" {
  value = module.compute.public_ip
}

output "ssh_command" {
  value = "ssh -i vm_key.pem ${var.admin_username}@${module.compute.public_ip}"
}

output "app_url" {
  value = "http://${module.compute.public_ip}:8080"
}
