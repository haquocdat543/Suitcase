resource "google_compute_instance" "master" {
  name         = "master-instance"
  machine_type = "e2-medium"
  zone         = "asia-northeast1-a"

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-stream-9"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}
  }

  metadata = {
    ssh-keys = var.ssh_key
  }

  metadata_startup_script = file("./scripts/rbmq.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.test_sa.email
    scopes = ["cloud-platform"]
  }
}
