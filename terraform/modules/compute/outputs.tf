output "public_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "private_key_pem" {
  value     = tls_private_key.ssh.private_key_pem
  sensitive = true
}
