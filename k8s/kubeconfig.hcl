data "template_file" "kubeconfig" {
  template = file("kubeconfig-template.yaml")

  vars = {
    cluster_name    = google_container_cluster.k8s.name
    user_name       = google_container_cluster.k8s.master_auth[0].username
    user_password   = google_container_cluster.k8s.master_auth[0].password
    endpoint        = google_container_cluster.k8s.endpoint
    cluster_ca      = google_container_cluster.k8s.master_auth[0].cluster_ca_certificate
    client_cert     = google_container_cluster.k8s.master_auth[0].client_certificate
    client_cert_key = google_container_cluster.k8s.master_auth[0].client_key
  }
}

resource "local_file" "kubeconfig" {
  content  = data.template_file.kubeconfig.rendered
  filename = "/root/terraform-gke/kubeconfig"
}