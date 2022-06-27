# terraform-aws
Terraform AWS Cloud examples for beginners

## Terraform Init With s3 Backend

terraform init \
    -backend-config="key=dev/vpc.tfstate" \
    -backend-config="bucket=dcube-terraform-state" \
    -backend-config="region=us-west-2" 

terraform destory \
    -backend-config="key=dev/vpc.tfstate" \
    -backend-config="bucket=dcube-terraform-state" \
    -backend-config="region=us-west-2" 


## Requirements

1. Create VPC (10.0.0.0/16)
2. Create Subnets
    - Public Subnets (For LB)
        - 10.0.1.0/24
        - 10.0.2.0/24
        - 10.0.3.0/24
    - App Subnetes (Private Subnet)
        - 10.0.4.0/24
        - 10.0.5.0/24
        - 10.0.6.0/24
    - DB Subnetes (Priavet Subnet)
        - 10.0.7.0/24
        - 10.0.8.0/24
        - 10.0.9.0/24
3. Public subnets can talk to app subnets (only on specific ports using NAC) not DB subnets.
4. App Subnets can talk to DB subnets (On specify ports using NACL)


## Command Reference

Update all outputs:

<pre>terraform refresh</pre>

Show all outputs:

<pre>terraform show</pre>



