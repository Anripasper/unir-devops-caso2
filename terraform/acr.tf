#nombre del ACR aleato
resource "random_string" "acr_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.prefix}acr${random_string.acr_suffix.result}"
  resource_group_name = azurerm_resource_group.casopract2.name
  location            = azurerm_resource_group.casopract2.location
  sku = var.acr_sku
  #acceso mediante autenticación
  admin_enabled = true
  #accesible desde Internet
  public_network_access_enabled = true
 #version casopractico2
  tags = {
    proyecto = "casopractico2"
  }
}
