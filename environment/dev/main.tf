
module "resource_group_name" {
  source      = "../../modules/azurerm_resource_group"
  for_each    = var.resource_group_name
  rg_name     = each.value.name
  rg_location = each.value.location

}

module "vnet" {
  depends_on    = [module.resource_group_name]
  source        = "../../modules/azurerm_virtual_network"
  for_each      = var.virtualnet
  vnetname      = each.value.name
  location      = each.value.location
  rg_name       = each.value.rg_name
  address_space = ["10.0.0.0/16"]
  dns_servers   = ["10.0.0.4", "10.0.0.5"]
  tags = {
    environment = "Devlopment"
  }

}

