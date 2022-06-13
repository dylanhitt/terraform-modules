variable "name" {
  type        = string
  description = "name for the cluster."
}

variable "role_arn" {
  type        = string
  description = "IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API. Typically: https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes Version"
}

variable "create_log_group" {
  type        = bool
  description = "(Optional) Create a AWS log group?"
  default     = false
}

variable "public_access" {
  type        = bool
  description = "Is the Kubernetes API publicly endpoint available. This should only be enabled on bootstrapping, or low level changes of the cluster, if necessary."
  default     = false
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS cluster (ENIs) will be provisioned along with the nodes/node groups. Node groups can be deployed within a different set of subnet IDs from within the node group configuration"
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key value map of tags to apply to the IAM role."
  default     = {}
}

variable "oidc" {
  type        = bool
  description = "(Optional) Would you like IAM Roles for service account via oidc?"
  default     = false
}
