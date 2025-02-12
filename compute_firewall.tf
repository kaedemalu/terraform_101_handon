resource "google_compute_firewall" "bastion" {
  name    = "bastion"
  network = "sample-network"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["bastion"]
}

resource "google_compute_firewall" "from_bastion" {
  name    = "from-bastion"
  network = "sample-network"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["bastion"]
  target_tags = ["from-bastion"]
}

resource "google_compute_firewall" "sample_network_allow_http" {
  name    = "sample-network-allow-http"
  network = "sample-network"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-server"]
}