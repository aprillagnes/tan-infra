resource "google_compute_address" "static" {
  name = "${var.app}-external-ip-${var.env}"
}

data "google_compute_image" "debian_image" {
  family  = "debian-12"
  project = "debian-cloud"
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.app}-${var.jenkins_instance.name}-${var.env}"
  machine_type = var.jenkins_instance.machine_type
  description  = var.jenkins_instance.description
  tags         = var.jenkins_instance.network_tags
  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    network    = google_compute_network.prod.self_link
    subnetwork = google_compute_subnetwork.prod.self_link
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}
