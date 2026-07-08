output "resource_group_name" {
  value = azurerm_resource_group.casopract2.name
}

output "acr_login_server" {
  description = "URL del registry (para podman build/push)."
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value     = azurerm_container_registry.acr.admin_username
  sensitive = true
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "vm_public_ip" {
  description = "IP pública de la VM (SSH y web del CV)."
  value       = azurerm_public_ip.vm_pip.ip_address
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

# inventario ansible
resource "local_file" "ansible_inventory" {
  filename        = "${path.module}/../ansible/hosts.ini"
  file_permission = "0644"
  content         = <<-EOT
    [podman_vm]
    ${var.prefix}-vm ansible_host=${azurerm_public_ip.vm_pip.ip_address}

    [podman_vm:vars]
    ansible_user=${var.admin_username}
    ansible_ssh_private_key_file=${var.ssh_private_key_path}
    ansible_ssh_common_args='-o StrictHostKeyChecking=no'
  EOT
}

resource "local_sensitive_file" "ansible_group_vars" {
  filename        = "${path.module}/../ansible/group_vars/all.yml"
  file_permission = "0600"
  content         = <<-EOT
    acr_login_server: "${azurerm_container_registry.acr.login_server}"
    acr_username: "${azurerm_container_registry.acr.admin_username}"
    acr_password: "${azurerm_container_registry.acr.admin_password}"
    image_tag: "casopractico2"
  EOT
}

# kubeconfig del cluster para el playbook de Kubernetes
resource "local_sensitive_file" "kubeconfig" {
  filename        = "${path.module}/../ansible/kubeconfig"
  file_permission = "0600"
  content         = azurerm_kubernetes_cluster.aks.kube_config_raw
}
