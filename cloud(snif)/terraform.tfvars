# Application Definition 
#app_name    = "iac-ubuntu"
#app_domain  = "muse.com"
#environment = "dev" # Dev, Test, Prod, etc

# GCP Settings
gcp_project   = "apt-muse-391009"
gcp_region    = "europe-west1"
gcp_zone      = "europe-west1-d"
gcp_auth_file = "../key/apt-muse-391009-1010fa9c638c.json"

# GCP Netwok
network-subnet-cidr = "10.10.10.0/24"

# Linux VM
linux_instance_type = "e2-micro"