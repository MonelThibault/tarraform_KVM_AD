# Defining VM Volume
resource "libvirt_volume" "debian11-qcow2" {
  name = "debian11.qcow2"
  pool = "default"
  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  source = "/media/thibault.monel@Digital-Grenoble.local/DATA/image-vm/debian-10-openstack-amd64.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "test-os_image" {
  name            = "test-os_image"
  base_volume_id  = libvirt_volume.debian11-qcow2.id
  pool            = "default"
  size            = 10737418240
}

# Get user data info (User, password, and ssh pubkey)
data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init.cfg")}"
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit.iso"
  pool = "default" # List storage pools using virsh pool-list
  user_data      = "${data.template_file.user_data.rendered}"
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
    volume_id = "${libvirt_volume.test-os_image.id}"
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