terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    #Esto nos generará el nombre del ACR
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    # Declaramos local para generar los ficheros de Ansible
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
provider "azurerm" {
  features {}
  # azurerm 4. es obligatorio indicar la suscripción 
  subscription_id = var.subscription_id != "" ? var.subscription_id : null
}
# Esto permite gestionar el proyecto y uso las variables para hacerlo más sencillo
resource "azurerm_resource_group" "casopract2" {
  name     = "${var.prefix}-casopract2"
  location = var.location

  tags = {
    proyecto = "casopractico2"
  }
}
#cambiar nombre
moved {
  from = azurerm_resource_group.rg
  to   = azurerm_resource_group.casopract2
}
