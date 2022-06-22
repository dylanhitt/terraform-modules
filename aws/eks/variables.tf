variable "name" {
  type        = string
  description = "name for the cluster."
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
  default     = [""]
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key value map of tags to apply to the IAM role."
  default     = {}
}

variable "oidc" {
  type        = bool
  description = "(Optional) Would you like IAM Roles for service account via oidc?"
  default     = true
}

variable "cni_addon" {
  type        = bool
  description = "(Optional) Would you like to run the AWS VPC CNI with IAM role. Default true"
  default     = true
}

variable "create_vpc" {
  type        = bool
  description = "(Optional) Would you like a VPC with EKS tailored subnets created for you?"
  default     = false
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for your vpc. Default: 10.0.0.0/16"
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR list for private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR list for public subnets"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "default_nodegroup" {
  type        = bool
  description = "(Optional) Would you like a nodegroup to be created for you."
  default     = false
}
