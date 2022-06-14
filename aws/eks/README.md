# EKS

Terraform modules related to creating an EKS Cluster

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | > 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cni_addon"></a> [cni\_addon](#module\_cni\_addon) | ./cni-addon | n/a |
| <a name="module_default_nodegroup"></a> [default\_nodegroup](#module\_default\_nodegroup) | ./nodegroup | n/a |
| <a name="module_eks_role"></a> [eks\_role](#module\_eks\_role) | ./assumable-role | n/a |
| <a name="module_oidc"></a> [oidc](#module\_oidc) | ./oidc-provider | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_policy_document.eks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes Version | `string` | n/a | yes |
| <a name="input_cni_addon"></a> [cni\_addon](#input\_cni\_addon) | (Optional) Would you like to run the AWS VPC CNI with IAM role. Default true | `bool` | `true` | no |
| <a name="input_create_log_group"></a> [create\_log\_group](#input\_create\_log\_group) | (Optional) Create a AWS log group? | `bool` | `false` | no |
| <a name="input_default_nodegroup"></a> [default\_nodegroup](#input\_default\_nodegroup) | (Optional) Would you like a nodegroup to be created for you. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | name for the cluster. | `string` | n/a | yes |
| <a name="input_oidc"></a> [oidc](#input\_oidc) | (Optional) Would you like IAM Roles for service account via oidc? | `bool` | `true` | no |
| <a name="input_public_access"></a> [public\_access](#input\_public\_access) | Is the Kubernetes API publicly endpoint available. This should only be enabled on bootstrapping, or low level changes of the cluster, if necessary. | `bool` | `false` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs where the EKS cluster (ENIs) will be provisioned along with the nodes/node groups. Node groups can be deployed within a different set of subnet IDs from within the node group configuration | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key value map of tags to apply to the IAM role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_authority_data"></a> [certificate\_authority\_data](#output\_certificate\_authority\_data) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
<!-- END_TF_DOCS -->