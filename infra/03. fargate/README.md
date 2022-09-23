### Create a Fargate deployment for the containerised app

This was Friday's approach, which went better than EKS, but I didn't manage to finish it. This configuration _mostly_ results in a deployment of a working application, but not exactly. The resulting tasks seem to fail health checks, I haven't resolved this yet.

Note this on its own wouldn't be an automated deployment yet, this Terraform configuration deploys the latest version of the service once - there's no updates when a new container is published.