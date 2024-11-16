resource "google_compute_network" "prod" {
  name                    = "${var.app}-vpc-${var.env}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "prod" {
  name          = "${var.app}-subnet-${var.env}"
  ip_cidr_range = var.ip_cidr_range[0]
  region        = var.region
  network       = google_compute_network.prod.self_link
}
