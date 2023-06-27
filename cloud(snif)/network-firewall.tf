# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "muse-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http"] 
}# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "muse-fw-allow-ssh"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh"]
}