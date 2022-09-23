## PPRO DevOps Engineering Challenge

This repository contains code for the application and its required infrastructure to run on AWS.

#### [.github](./.github/)

This folder contains CI/CD configuration for the project:
 - dependabot automated updates
 - GitHub action that publishes a Docker image to the GitHub Container Registry with each new version of the application

#### [app](./app/)

This folder contains the code for the application and notes for the developer.

#### [infra/01. terraform-state](./infra/01.%20terraform-state/)

This folder contains the one-off Terraform configuration to create remote state bucket.

#### [infra/02. eks](./infra/02.%20eks/)

This folder contains the Terraform configuration to create an EKS cluster.

### Required tools for working with the infrastructure

 - [`terraform`](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
 - `AWS CLI` Installing for: [Windows](https://community.chocolatey.org/packages/awscli) [Linux](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) [macOS](https://formulae.brew.sh/formula/awscli)
 - [setup `AWS CLI` credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) - verify with `aws configure list`

### Note on environments and workspaces

The infrastructure code is written to support two separate environments, `prod` and `dev`. In this challenge, I've separated them only by name (and using tags). In a practical usage scenario (for billing, security, usage limits, segregation, etc) those would be using not only separate Terraform workspaces, but also separate AWS accounts. This can be done e.g. by varying the `profile` field in the `provider "aws"` block based on the workspace selected. Please note that the Terraform remote backend should use the same `profile` (in a larger organisation - probably a dedicated one) across all workspaces. [More reading on using different AWS profiles with different Terraform workspaces.](https://alessandromarinoac.com/posts/iac/terraform/terraform-workspaces-multiple-accounts/)

Another possible approach, if full isolation is required, is to use `-backend-config="KEY=VALUE"` option for `terraform init` in order to use different storage options for different environments. When used from the command line this, to me, feels more error prone than Terraform workspaces, but if the configuration is only applied through CI/CD process, then this approach might be preferrable.

### Note on choosing Docker, Kubernetes and EKS

From developer's point of view, there's little practical difference between VMs and containers - if anything, containers are somewhat cheaper and faster. They present a familiar approach to structuring and separating the applications. On the infrastructure side, the relative ease of deployment and instrumenting/extending them with metrics, observability, scaling, etc. is also an advantage. And they're practically language agnostic, meaning the infrastructure needs and preferences can be mostly decoupled from the preferences of the development team (not siloed - just able to be considered separately).

Cloud functions are "more cloud native", perhaps - more of the operations overhead is handled by the platform; and if done right, can be cheaper. They're also significantly more opinionated and restricted - and less familiar to most developers that I've met. They're something worth considering as an option, definitely, but in this case I went with something more universal.

When it comes to how to run those containers, I made a mistake - I went with EKS, as the last time I was deploying to AWS that was what was used for handling Kubernetes. I have now realised I should have used Fargate instead, I don't need the additional control EKS provides - but it's already Friday and I might not have the time to change that decision.

### Note on security, network segregation and limiting AWS account privileges

This is something I have the least experience with. I would not trust my current skills in that area to be enough for a production environment. This part would definitely require a through review.

### Things missing / TODO
- automatic deploy application to AWS 
- add database to the Terraform stuff and use it in the app
- write up steps to get this running from zero
