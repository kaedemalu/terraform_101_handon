resource "google_compute_router" "seoul_router" {
  name    = "seoul-router"
  region  = "asia-northeast3"
  network = google_compute_network.sample_network.id

  bgp {
    asn = 64514
  }
}