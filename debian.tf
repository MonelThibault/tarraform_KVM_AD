# Defining VM Volume
resource "libvirt_volume" "debian11-qcow2" {
  name = "debian11.qcow2"
  pool = "default"
  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  source = "../../Downloads/debian-10-openstack-amd64.qcow2"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "debian11" {
  name   = "debian11"
  memory = "2048"
  vcpu   = 2

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = "${libvirt_volume.debian11-qcow2.id}"
  }

  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"

  console {
    type = "pty"
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