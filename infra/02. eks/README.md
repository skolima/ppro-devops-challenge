### Create and maintain a basic EKS kubernetes cluster

This uses remote backend for terraform, so ensure the bucket has been created first and configured in `terraform -> backend "s3" -> bucket`. This terraform configuration can be safely changed / updated and re-run (e.g. via CI/CD pipeline - which I didn't do as this takes about 10 minutes to run).

Running (assuming your AWS credentials are configured):
```
    terraform init
    terraform plan
    terraform apply
```
