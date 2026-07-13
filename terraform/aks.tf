resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-aks"
  location            = azurerm_resource_group.casopract2.location
  resource_group_name = azurerm_resource_group.casopract2.name
  dns_prefix          = "${var.prefix}-aks"

  sku_tier = "Free".
  oidc_issuer_enabled = true

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = {
    proyecto = "casopractico2"
  }
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}
