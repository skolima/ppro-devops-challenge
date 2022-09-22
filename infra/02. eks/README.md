### Create and maintain a basic EKS kubernetes cluster

This uses remote backend for terraform, so - if using a new AWS account - ensure the bucket has been created first (using [`01. terraform-state`](../01.%20terraform-state/)) and configured in `terraform -> backend "s3" -> bucket`. This configuration uses Terraform workspaces, which you will need to create after creating the bucket, but before the first run. Use the following command to create them:
```
    terraform workspace new prod
    terraform workspace new dev    
```
To switch workspaces later, use `terraform workspace select dev`.

### Usage

This terraform configuration can be safely changed / updated and re-run (e.g. via CI/CD pipeline - which I didn't do as this takes about 10 minutes to run).

Running (assuming your AWS credentials are configured):
```
    terraform init
    terraform plan
    terraform apply
```
