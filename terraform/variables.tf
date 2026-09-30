variable "resource_group_name" {
  description = "Existing resource group"
  type        = string
  default     = "Vaishnavi_Rg"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "vaishnavi"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2ats_v2"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "app_dir" {
  description = "Folder on the VM where compose.yaml is copied"
  type        = string
  default     = "/opt/app"
}
