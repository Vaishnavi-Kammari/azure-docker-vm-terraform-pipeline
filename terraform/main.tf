module "resource_group" {
  source = "./modules/resource_group"
  name   = var.resource_group_name
}

module "network" {
  source              = "./modules/network"
  prefix              = var.prefix
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

module "compute" {
  source              = "./modules/compute"
  prefix              = var.prefix
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.network.subnet_id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  app_dir             = var.app_dir
}

# Save the generated private key next to the code (used for the Azure DevOps SSH service connection)
resource "local_file" "private_key" {
  content         = module.compute.private_key_pem
  filename        = "${path.module}/vm_key.pem"
  file_permission = "0600"
}
