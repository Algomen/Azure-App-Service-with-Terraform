provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "tfstate2989"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key           = "/azEK2WtUl0Bo/49yWK7b2rUrxCAh3AKpD1MRk7kSJ+tWM+AouKSIg/WY1K4LWCFR4M28OmOaZFm+AStx6dksg=="
  }
}

data "azurerm_resource_group" "main" {
  name = "Azuredevops"
}

# Reference the AppService Module here.
module "app_service" {
  source               = "../../modules/appservice"
  resource_group       = "${data.azurerm_resource_group.main.name}"
  location             = "${var.location}"
  resource_type        = "${var.resource_type}"
  application_type     = "{var.application_type}"
  tags                 = "${local.tags}"
}
  
  
  /*
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${data.resource_group}"
  location             = "${var.location}"
}
  */
