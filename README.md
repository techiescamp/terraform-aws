# terraform-aws
Terraform AWS provisioning examples for beginners

## Hit the Star! ⭐
If you are planning to use this Terraform repo for learning, please hit the star. Thanks!

## Terraform Init With s3 Backend

```
terraform init \
    -backend-config="key=dev/vpc.tfstate" \
    -backend-config="bucket=dcube-terraform-state" \
    -backend-config="region=us-west-2" \
    -backend-config="dynamodb_table=terraform-state-lock"
```
```

terraform destroy \
    -backend-config="key=dev/vpc.tfstate" \
    -backend-config="bucket=dcube-terraform-state" \
    -backend-config="region=us-west-2" \
    -backend-config="dynamodb_table=terraform-state-lock"
```

## RDS Provisioning

cd into the `environments/dev/rds` directory and run the following commands:

```
terraform init

terraform plan -var-file=../../../vars/dev/rds.tfvars

terraform apply -var-file=../../../vars/dev/rds.tfvars

terraform destroy -var-file=../../../vars/dev/rds.tfvars
```

## EC2 Instance Provisioning

1. Navigate to the `environment/dev` folder:

```bash
cd environment/dev
```

2. Open the `ec2.tfvars` file and modify it with your desired details. This file contains variables used in the Terraform configuration.

### Deployment

1. Initialize Terraform in the working directory:

```bash
terraform init
```

2. Create an execution plan:

```bash
terraform plan -var-file=../../../vars/dev/ec2.tfvars
```

3. Apply the changes to create the EC2 instance:

```bash
terraform apply -var-file=../../../vars/dev/ec2.tfvars
```

4. To destroy the EC2 instance and associated resources:

```bash
terraform destroy -var-file=../../../vars/dev/ec2.tfvars
```

**Note**: Always review the execution plan (`terraform plan`) before applying changes to avoid unintended modifications.

## AWS Organization Tag Policy Creation.

1. Navigate to the `environment/dev` folder:

```bash
cd environment/tag-policy
```

2. Open the `tag-policy.tfvars` file and modify it with your desired details. This file contains variables used in the Terraform configuration.

### Deployment

1. Initialize Terraform in the working directory:

```bash
terraform init
```

2. Create an execution plan:

```bash
terraform plan -var-file=../../../vars/dev/tag-policy.tfvars
```

3. Apply the changes to create the Tag Policy:

```bash
terraform apply -var-file=../../../vars/dev/tag-policy.tfvars
```

4. To destroy the Tag Policy:

```bash
terraform destroy -var-file=../../../vars/dev/tag-policy.tfvars
```

**Note**: Always review the execution plan (`terraform plan`) before applying changes to avoid unintended modifications.

## Terraform Command Reference

Update all outputs:

<pre>terraform refresh</pre>

Show all outputs:

<pre>terraform show</pre>



