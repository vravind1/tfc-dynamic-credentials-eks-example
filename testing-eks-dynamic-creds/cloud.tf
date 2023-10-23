terraform {
  cloud {
    organization = "k8s-dynamic-creds"

    workspaces {
      name = "vr-testing"
    }
  }
}
