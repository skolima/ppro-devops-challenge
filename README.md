## PPRO DevOps Engineering Challenge

This repository contains code for the application and its required infrastructure to run on AWS.

#### [.github](./.github/)

This folder contains CI/CD configuration for the project:
 - dependabot automated updates
 - GitHub action that publishes a Docker image with each new version of the application

#### [app](./app/)

This folder contains the code for the application and notes for the developer.

#### [infra/01. terraform-state](./infra/01.%20terraform-state/)

This folder contains the one-off terraform configuration to create remote state bucket.

#### [infra/02. eks](./infra/02.%20eks/)

This folder contains the terraform configuration to create an EKS cluster.

### Required tools for working with the infrastructure

 - [`terraform`](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
 - `AWS CLI` Installing for: [Windows](https://community.chocolatey.org/packages/awscli) [Linux](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) [macOS](https://formulae.brew.sh/formula/awscli)
 - [setup `AWS CLI` credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) - verify with `aws configure list`

### Things missing / TODO
- automatic deploy application to AWS 
- add database to the terraform stuff and use it in the app
- two environments as terraform workspaces
- writetup steps to get this running from zero
