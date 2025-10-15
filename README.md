# terraform-aws

Examples for provisioning AWS with Terraform using simple environment layouts.

If this repo helps you, please ⭐ it.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Init with S3 Backend](#init-with-s3-backend)
- [VPC Provisioning](#vpc-provisioning)
- [RDS Provisioning](#rds-provisioning)
- [ALB + ASG Provisioning](#alb--asg-provisioning)
- [EC2 Provisioning](#ec2-provisioning)
- [AWS Organization Tag Policy](#aws-organization-tag-policy)
- [Terraform Command Reference](#terraform-command-reference)
- [Notes](#notes)

---

## Prerequisites

- Terraform installed
- AWS credentials configured (e.g., `aws configure`)
- S3 bucket and DynamoDB table for remote state and locking (if using the backend example)

---


## Init with S3 Backend

Use this when your workspace uses an S3 remote backend with DynamoDB locking.

```sh
terraform init \
  -backend-config="key=dev/vpc.tfstate" \
  -backend-config="bucket=dcube-terraform-state" \
  -backend-config="region=us-west-2" \
  -backend-config="dynamodb_table=terraform-state-lock" \
  -var-file=../../../vars/dev/vpc.tfvars
````

> Adjust `key`, `bucket`, `region`, and `dynamodb_table` to your setup.

---

## VPC Provisioning

From `environments/dev/vpc`:

```sh
# 1) Initialize
terraform init

# 2) Preview
terraform plan -var-file=../../../vars/dev/vpc.tfvars

# 3) Apply
terraform apply -var-file=../../../vars/dev/vpc.tfvars

# 4) Destroy (when needed)
terraform destroy -var-file=../../../vars/dev/vpc.tfvars
```

---

## RDS Provisioning

From `environments/dev/rds`:

```sh
terraform init
terraform plan   -var-file=../../../vars/dev/rds.tfvars
terraform apply  -var-file=../../../vars/dev/rds.tfvars
terraform destroy -var-file=../../../vars/dev/rds.tfvars
```

---

## ALB + ASG Provisioning

From `environments/dev/alb-asg`:

```sh
terraform init
terraform plan   -var-file=../../../vars/dev/alb-asg.tfvars
terraform apply  -var-file=../../../vars/dev/alb-asg.tfvars
terraform destroy -var-file=../../../vars/dev/alb-asg.tfvars
```

---

## EC2 Provisioning

From `environments/dev/ec2` (edit `vars/dev/ec2.tfvars` first):

```sh
terraform init
terraform plan   -var-file=../../../vars/dev/ec2.tfvars
terraform apply  -var-file=../../../vars/dev/ec2.tfvars
terraform destroy -var-file=../../../vars/dev/ec2.tfvars
```

> Always review the plan before applying.

---

## AWS Organization Tag Policy

From `environments/dev/tag-policy` (edit `vars/dev/tag-policy.tfvars` as needed):

```sh
terraform init
terraform plan   -var-file=../../../vars/dev/tag-policy.tfvars
terraform apply  -var-file=../../../vars/dev/tag-policy.tfvars
terraform destroy -var-file=../../../vars/dev/tag-policy.tfvars
```

---

## EKS + Karpenter Deployment

This section covers deploying an Amazon EKS cluster with Karpenter for dynamic node provisioning.

### Prerequisites

- AWS CLI configured with necessary permissions
- `kubectl` installed
- AWS IAM permissions for EKS and Karpenter operations

### 1. Deploy EKS Cluster

From `infra/eks-cluster`:

```sh
# Initialize with backend config
terraform init 

# Plan and review changes
terraform plan -var-file=../../vars/dev/eks.tfvars

# Apply the configuration
terraform apply -var-file=../../vars/dev/eks.tfvars
```

### 2. Deploy Karpenter

From `infra/eks-karpenter`:

```sh
# Initialize with backend config
terraform init

# Plan and review changes
terraform plan -var-file=../../vars/dev/karpenter.tfvars

# Apply the configuration
terraform apply -var-file=../../vars/dev/karpenter.tfvars
```

### 3. Verify Installation

After deployment:

```sh
# Update kubeconfig
aws eks update-kubeconfig --region <your-region> --name <cluster-name>

# Verify Karpenter pods
kubectl get pods -n karpenter
```

---

## Terraform Command Reference

Refresh state (re-reads remote objects and updates outputs):

```sh
terraform refresh
```

Show current state and outputs:

```sh
terraform show
```

---

## Notes

* Run Terraform **inside** an environment folder (e.g., `environments/dev/vpc`).
* Variable files live under `vars/dev/*.tfvars`.
* Backend config values in examples are placeholders—change them to match your infra.

---


