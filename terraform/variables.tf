variable "subscription_id" {
  description = "ID de la suscripcino"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Esta variable nombra prefijos"
  type        = string
  default     = "cp2"
}

variable "location" {
  description = "region"
  type        = string
  default     = "swedencentral"
}

variable "admin_username" {
  description = "Usuario administrador de la VM (lo usa Ansible por SSH)."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Clave publica SSH"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  description = "Clave privada SSH que usa Ansible para conectarse"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "vm_size" {
  description = " "
  type        = string
  default     = "Standard_B2s_v2"
}

variable "aks_node_count" {
  description = "Número de workers del cluster AKS En este proyecto se pide 1"
  type        = number
  default     = 1
}

variable "aks_node_vm_size" {
  description = "Tamaño del nodo worker de AKS"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "acr_sku" {
  description = "SKU del ACR"
  type        = string
  default     = "Basic"
}

variable "my_ip_cidr" {
  description = "IP pública propia para restringir el SSH de la virtual macine"
  type        = string
}
