variable "name" {
  description = "Role name"
  type        = string
}

variable "policy_document" {
  description = "Path to JSON file representation of an AWS assume role policy"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Key value map of tags to apply to the IAM role."
  default     = {}
}

variable "create_instance_profile" {
  type        = bool
  description = "Would you like to create instance profile for this role."
  default     = false
}

variable "attach_policy_arns" {
  type        = list(string)
  description = "List of policy arns to attach to this role."
  default     = []
}
