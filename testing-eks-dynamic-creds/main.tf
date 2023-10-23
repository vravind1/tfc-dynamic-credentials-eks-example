provider "kubernetes" {
  host                   = var.eks-endpoint-url
  cluster_ca_certificate = base64decode(var.eks-cluster-ca)
  token                  = file(var.tfc_kubernetes_dynamic_credentials.default.token_path)
}

resource "kubernetes_config_map" "simple_configmap" {
  metadata {
    name = "simple-config-map"
  }
  data = {
    "foo" = "bar"
  }
}
