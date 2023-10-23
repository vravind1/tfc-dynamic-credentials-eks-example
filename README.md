# tfc-dynamic-credentials-eks-example
Example code for bootstrapping trust between Terraform Cloud and k8s provider in order to use TFC's Workload Identity for EKS cluster

## Prerequisites
Before you get started, ensure you have the following prerequisites in place:

1. **Amazon EKS Cluster**: You must have an EKS cluster provisioned in AWS. If you do not have one, follow the instructions provided in this [link](https://github.com/vravind1/terraform-eks).

2. **Terraform Cloud (TFC) Account**: You need a TFC account. Register for an account [here](https://app.terraform.io/) if you don’t have one already.


## Configuring EKS to Trust TFC as OIDC Issuer

### Navigate to the `eks-oidc` directory:
  ```
   cd eks-oidc
  ```
### Initialize Terraform:
```
terraform init
```

### Plan your Terraform deployment, specifying the necessary variables:
```
terraform plan -var="cluster_name=your-cluster-name" -var="rbac_oidc_group_name=your-tfc-org-name"
```
### Apply the Terraform configuration:

```
terraform apply -var="cluster_name=your-cluster-name" -var="rbac_oidc_group_name=your-tfc-org-name"
```

> Now the EKS cluster trusts the TFC as the OIDC issuer

___

## Kubernetes Operations using dynamic credentials

### Creating a New Workspace for Kubernetes Operations

Using the TFC GUI

### Navigate to the testing-eks-dynamic-creds directory:

```
cd testing-eks-dynamic-creds
```
Replace the ```cloud.tf``` file with your Terraform Cloud organization name and workspace name.
Ensure all required variables are specified in the ```variables.tf``` file.

Log in to Terraform Cloud:

```
terraform login
```
Initialize Terraform:
```
terraform init
```
Plan your Terraform deployment:

```
terraform plan
```
Apply the Terraform configuration:

```
terraform apply
```
**Confirm the action when prompted.**


> You can now watch the run in Terraform Cloud. Note that each time you perform a run, a new token will be generated.

## Conclusion
In this guide, we successfully prepared the Amazon EKS cluster to trust Terraform Cloud as the OpenID Connect (OIDC) issuer. This integration is crucial for secure operations within our Kubernetes cluster. Following that, we demonstrated a Kubernetes operation using Terraform, utilizing dynamically generated tokens for authentication. Each new Terraform run resulted in the generation of a new token, showcasing the robust and secure integration between Amazon EKS and Terraform Cloud.
