output "app_public_ip" {
  value = module.network.app_public_ip
}

output "mannger_machine_public_ip" {
  value = module.network.mannger_machine_public_ip
}
output "db_server_user" {
  value = module.db.db_server_user
}
output "db_server_password" {
  value     = module.db.db_server_password
  sensitive = true
}

