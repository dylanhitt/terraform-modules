variable "oidc_issuer" {
  description = "Cluster oidc issuer"
  type        = string
}

variable "openid_connect_provider_arn" {
  description = "The arn of the openid provider"
  type        = string
}

variable "cluster_name" {
  description = "The suffix to append to cni_<this value>. The root module will typically pass in the cluster name."
  type        = string
}
