variable "cluster_name" {
  description = "The EKS cluster name that this nodegroup will be associated with."
  type        = string
}

variable "name" {
  description = "The name for the nodegroup."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS cluster (ENIs) will be provisioned along with the nodes/node groups. Node groups can be deployed within a different set of subnet IDs from within the node group configuration."
  type        = list(string)
}

variable "role_arn" {
  description = "The ARN of the IAM role that will be associated with this nodegroup."
  type        = string
  default     = ""
}

variable "desired_size" {
  description = "(Optional) The desired size fro the nodegroup."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "(Optional) The maximum scaling size for the nodegroup."
  type        = number
  default     = 5
}

variable "min_size" {
  description = "(Optional) The minimum scaling size for the nodegroup."
  type        = number
  default     = 1
}

variable "max_unavailable" {
  description = "(Optional) Desired max number of unavailable worker nodes during node group update."
  type        = number
  default     = 1
}

variable "disk_size" {
  description = "(Optional) Disk size in GiB for worker nodes."
  type        = number
  default     = 100
}

variable "capacity_type" {
  description = "(Optional) ype of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT."
  type        = string
  default     = "ON_DEMAND"
}

variable "instance_types" {
  description = "(Optional) List of instance types associated with the EKS Node Group. Defaults to ['t3.medium']."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "labels" {
  description = "(Optional) Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument."
  type        = map(string)
  default     = {}
}

variable "taints" {
  description = "(Optional) The Kubernetes taints to be applied to the nodes in the node group."
  type = map(object({
    value  = string
    effect = string
  }))
  default = {}
}

variable "create_iam_role" {
  description = "(Optional) Would you like a generic nodegroup IAM role to be created for you?"
  type        = bool
  default     = false
}
