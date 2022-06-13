# Bucket

Terraform module related to creating a EKS control-plane

## Variables

| Name | Description |
|------|-------------|
| name         | cluster name |
| role_arn | IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API. Typically: https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html |
| cluster_version     | Kubernetes Version |
| create_log_group | (Optional) Create a AWS log group? |
| public_access| Is the Kubernetes API publicly endpoint available. This should only be enabled on bootstrapping, or low level changes of the cluster, if necessary. |
| subnet_ids | A list of subnet IDs where the EKS cluster (ENIs) will be provisioned along with the nodes/node groups. Node groups can be deployed within a different set of subnet IDs from within the node group configuration |
| tags | (Optional) Key value map of tags to apply to the IAM role. |
| oidc | (Optional) Would you like IAM Roles for service account via oidc? Default `false` |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | control plan endpoint |
| certificate_authority_data | control plane CA certificate data |