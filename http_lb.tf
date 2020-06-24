resource "google_compute_health_check" "web_health" {
  name = "web-health"
  timeout_sec        = 1
  check_interval_sec = 1
  tcp_health_check {
    port = "80"
  }
}

resource "google_compute_backend_service" "web_backend" {
  name        = "web-backend"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 3000

  backend {
    group = google_compute_instance_group.web_instance_group.self_link
  }

  health_checks = [google_compute_health_check.web_health.self_link]
}

resource "google_compute_instance_group" "web_instance_group" {
  name        = "web-instance-group"

  instances = [google_compute_instance.web_instance.self_link]

  zone = "asia-northeast1-a"
}