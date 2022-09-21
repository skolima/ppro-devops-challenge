## PPRO DevOps Engineering Challenge

This repository contains code for the application and its required infrastructure to run on AWS.

#### [.github](./github/)

This folder contains CI/CD configuration for the project:
 - dependabot automated updates
 - GitHub action that publishes a Docker image with each new version of the application

#### [app](./app/)

This folder contains the code for the application.

#### [infra/01. terraform-state](./infra/01.%20terraform-state/)

This folder contains the one-off terraform configuration to create remote state bucket.

#### [infra/02. eks](./infra/02.%20eks/)

This folder contains the terraform configuration to create an EKS cluster.

### Required tools

 - *TODO* document
 - *TODO* document credentials for AWS
 - the application requires different tools, documented separately

### Things missing / TODO
- document tooling requirements and AWS credentials
- automatic deploy application to AWS 
- add database to the terraform stuff and use it in the app
- two environments as terraform workspaces
- writetup steps to get this running from zero
