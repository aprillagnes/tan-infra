resource "google_compute_firewall" "jenkins" {
  name    = "${var.app}-${var.jenkins_instance.name}-${var.env}"
  network = google_compute_network.prod.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.jenkins_instance.ports
  }

  target_tags   = var.jenkins_instance.network_tags
  source_ranges = ["0.0.0.0/0"]
}
