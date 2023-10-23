variable "eks-endpoint-url" {
  description = "The URL of the EKS cluster endpoint, used to connect to the Kubernetes API server"
  type        = string
}

variable "eks-cluster-ca" {
  description = "The Base64-encoded certificate data required to communicate with the EKS cluster"
  type        = string
}

variable "tfc_kubernetes_dynamic_credentials" {
  description = "Object containing Kubernetes dynamic credentials configuration"
  type = object({
    default = object({
      token_path = string
    })
  })
}
