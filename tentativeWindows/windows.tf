# Defining VM Volume
resource "libvirt_volume" "win2k19" {
  name = "windows"
  pool = "default"
  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  source = "../../Downloads/17763.3650.221105-1748.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso"
  format = "iso"
}

# Define KVM domain to create
resource "libvirt_domain" "windows" {
  name   = "windows"
  memory = "2048"
  vcpu   = 2

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = "${libvirt_volume.win2k19.id}"
  }

  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"

  console {
    type = "tty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

# Output Server IP
#output "ip-deb" {
#  value = "${libvirt_domain.debian11.network_interface.0.addresses.0}"
#}