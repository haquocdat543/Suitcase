output "master-internal-ip" {
  description = "Master private IP"
  value       = google_compute_instance.master.network_interface.0.network_ip
}

output "master-external-ip" {
  description = "Master public IP"
  value       = google_compute_instance.master.network_interface.0.access_config.0.nat_ip
}
