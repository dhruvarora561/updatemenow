packer {
  required_plugins {
    azure = {
      version = ">= 2.1.7"
      source  = "github.com/hashicorp/azure"
    }
    ansible = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/ansible"
    }

  }
}

source "azure-arm" "windows" {
  client_id       = var.CLIENT_ID
  client_secret   = var.CLIENT_SECRET
  subscription_id = var.SUBSCRIPTION_ID
  tenant_id       = var.TENANT_ID

  os_type         = "Windows"
  image_publisher = "MicrosoftWindowsDesktop"
  image_offer     = "Windows-11"
  image_sku       = "win11-23h2-pro"

  communicator                      = "winrm"
  winrm_insecure                    = true
  winrm_timeout                     = "5m"
  winrm_use_ssl                     = true
  winrm_username                    = "packer"
  winrm_password                    = var.WINRM_PASSWORD

  managed_image_name                = "windows11updated"
  managed_image_resource_group_name = "buildagent"

  shared_image_gallery_destination {
    subscription                 = var.SUBSCRIPTION_ID
    gallery_name                 = "my_shared_gallery"
    image_name                   = "my-image-definition"
    image_version                = "1.0.0"
    resource_group               = "buildagent"
    replication_regions          = ["East US"]
  }

  build_resource_group_name = "buildagent"
  vm_size                   = "Standard_DS2_v2"


}

build {
  sources = ["azure-arm.windows"]
provisioner "powershell" {
  script = "ins.ps1"
}

}