/*
resource "google_container_node_pool" "k8s_node_pool" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.k8s.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n2-standard-2"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
*/