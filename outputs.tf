output "key_name" {
  description = "The generated key name."
  value = local.key_name
}

output "private_key" {
  description = "The private part of the key. BE CAREFUL."
  value = tls_private_key.main.private_key_pem
  sensitive = true
}
