variable "name" {
  description = "Role name"
  type        = string
}

variable "policy_document" {
  description = "aws_iam_policy_document data object representation of the policy"
  type        = any
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key value map of tags to apply to the IAM role."
  default     = {}
}

variable "create_instance_profile" {
  type        = bool
  description = "(Optional) Would you like to create instance profile for this role."
  default     = false
}

variable "attach_policy_arns" {
  type        = list(string)
  description = "(Optional) List of policy arns to attach to this role."
  default     = []
}
