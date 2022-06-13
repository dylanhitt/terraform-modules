# Bucket

Terraform module related to creating a IAM assumable role.

## Variables

| Name | Description |
|------|-------------|
| name         | Role name |
| policy_document            | Path to JSON file representation of an AWS assume role policy |
| tags     | (Optional) Key value map of tags to apply to the IAM role. |
| create_instance_profile | (Optional) Would you like to create instance profile for this role. Default `false` |
| attach_policy_arns  | (Optional) List of policy arns to attach to this role. Default: `[]` |

## Outputs

NA