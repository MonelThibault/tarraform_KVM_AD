# Bootstrapping Script to Install Apache (and thus checking that everything is working)

data "template_file" "linux-metadata" {
template = <<EOF
sudo apt-get update; 
sudo apt-get install -y apache2;
sudo systemctl start apache2;
sudo systemctl enable apache2;
EOF
}

resource "google_compute_instance" "vm_instance_public" {
  name         = "muse-vm"
  machine_type = var.linux_instance_type
  zone         = var.gcp_zone
  hostname     = "muse-vm.muse.com"
  tags         = ["ssh","http"] 

  boot_disk {
    initialize_params {
      image = var.ubuntu_2204_sku
    }
  }  

  metadata_startup_script = data.template_file.linux-metadata.rendered  
  
  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config { }
  }
}