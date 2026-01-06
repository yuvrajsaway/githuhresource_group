terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "DoNotDeleteRg"
    storage_account_name = "donotdeletestorage555555"                          # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                   # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "testyuvi.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {
  }

  subscription_id = "a9076473-03ad-4c76-8993-4edd69689ba6"
}
