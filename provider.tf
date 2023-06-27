terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  ## Configuration options
  uri = "qemu:///system"
  #alias = "server2"
  #uri   = "qemu+ssh://root@192.168.100.10/system"
}

# What is a provider ? From hashicorp documentation :
#Providers allow Terraform to interact with cloud providers, SaaS providers, and other APIs.
#Some providers require you to configure them with endpoint URLs, cloud regions, or other settings before Terraform can use them.