variable "subscription_id" {
  description = "ID de la suscripción. Vacío si se usa la variable de entorno ARM_SUBSCRIPTION_ID."
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Prefijo para nombrar los recursos del proyecto."
  type        = string
  default     = "cp2"
}

variable "location" {
  description = "Región de Azure. Cuenta de estudiante: comprobar regiones permitidas por la política de la suscripción."
  type        = string
  default     = "swedencentral"
}

variable "admin_username" {
  description = "Usuario administrador de la VM (lo usa Ansible por SSH)."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Clave pública SSH que se inyecta en la VM."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  description = "Clave privada SSH con la que Ansible se conecta (para el inventario generado)."
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "vm_size" {
  description = "Tamaño de la VM. B2s_v2 = 2 vCPU x86, disponible en la suscripción de estudiante."
  type        = string
  default     = "Standard_B2s_v2"
}

variable "aks_node_count" {
  description = "Número de workers del cluster AKS (el enunciado pide 1)."
  type        = number
  default     = 1
}

variable "aks_node_vm_size" {
  description = "Tamaño del nodo worker de AKS."
  type        = string
  default     = "Standard_B2s_v2"
}

variable "acr_sku" {
  description = "SKU del ACR. Basic es suficiente y el más económico."
  type        = string
  default     = "Basic"
}

variable "my_ip_cidr" {
  description = "IP pública propia en formato CIDR (x.x.x.x/32) para restringir el SSH de la VM."
  type        = string
}
