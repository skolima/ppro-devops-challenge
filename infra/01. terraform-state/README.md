### Create state and lock resources for other Terraform configurations

This is a one-off thing. Also, it itself can't use remote-backed storage for state, as this would create a reference loop. So create this once per account and don't touch it afterwards.

Running (assuming your AWS credentials are configured):
```
    terraform init
    terraform plan
    terraform apply
```

This will output an S3 bucket name, which needs to be entered into `terraform -> backend "s3" -> bucket` field of other configurations.

### Workspaces / environments

Terraform remote state supports reusing the same remote state storage for multiple workspaces. Thus this remote state is created only using the default workspace. For more information please consult [Terraform documentation on workspaces](https://www.terraform.io/language/state/workspaces).