# Nodegroup

Module used to create node groups

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | > 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | > 4.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_role"></a> [role](#module\_role) | ./../assumable-role | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | (Optional) ype of capacity associated with the EKS Node Group. Valid values: ON\_DEMAND, SPOT. | `string` | `"ON_DEMAND"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The EKS cluster name that this nodegroup will be associated with. | `string` | n/a | yes |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | (Optional) Would you like a generic nodegroup IAM role to be created for you? | `bool` | `false` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | (Optional) The desired size fro the nodegroup. | `number` | `2` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | (Optional) Disk size in GiB for worker nodes. | `number` | `100` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | (Optional) List of instance types associated with the EKS Node Group. Defaults to ['t3.medium']. | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | (Optional) Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. | `map(string)` | `{}` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | (Optional) The maximum scaling size for the nodegroup. | `number` | `5` | no |
| <a name="input_max_unavailable"></a> [max\_unavailable](#input\_max\_unavailable) | (Optional) Desired max number of unavailable worker nodes during node group update. | `number` | `1` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | (Optional) The minimum scaling size for the nodegroup. | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the nodegroup. | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The ARN of the IAM role that will be associated with this nodegroup. | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs where the EKS cluster (ENIs) will be provisioned along with the nodes/node groups. Node groups can be deployed within a different set of subnet IDs from within the node group configuration. | `list(string)` | n/a | yes |
| <a name="input_taints"></a> [taints](#input\_taints) | (Optional) The Kubernetes taints to be applied to the nodes in the node group. | <pre>map(object({<br>    value  = string<br>    effect = string<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->