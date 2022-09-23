resource "aws_ecs_service" "ppro_devops_service" {
  name            = "ppro-devops-service"
  task_definition = aws_ecs_task_definition.ppro_devops_service.arn
  cluster         = aws_ecs_cluster.app.id
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = false

    security_groups = [
      aws_security_group.egress_all.id,
      aws_security_group.ingress_api.id,
    ]

    subnets = [
      aws_subnet.private_d.id,
      aws_subnet.private_e.id,
    ]
  }

  load_balancer {
   target_group_arn = aws_lb_target_group.ppro_devops_service.arn
   container_name   = "ppro-devops-challenge"
   container_port   = "80"
 }

 desired_count = 1
 health_check_grace_period_seconds = 10
}

resource "aws_cloudwatch_log_group" "ppro_devops_service" {
  name = "/ecs/ppro-devops-challenge"
}

resource "aws_ecs_task_definition" "ppro_devops_service" {
  family = "ppro-devops-challenge"

  container_definitions = jsonencode(
    [
      {
        "name" : "ppro-devops-challenge",
        "image" : "ghcr.io/skolima/ppro-devops-challenge:main",
        "portMappings" : [
          {
            "containerPort" : 80
          }
        ],
        "logConfiguration" : {
          "logDriver" : "awslogs",
          "options" : {
            "awslogs-region" : var.region,
            "awslogs-group" : aws_cloudwatch_log_group.ppro_devops_service.name,
            "awslogs-stream-prefix" : "ecs"
          }
        }
      }
  ])

  execution_role_arn = aws_iam_role.ppro_challenge_task_execution_role.arn
  depends_on = [
    aws_iam_role.ppro_challenge_task_execution_role
  ]

  # These are the minimum values for Fargate containers.
  cpu                      = 256
  memory                   = 512

  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
}

resource "aws_ecs_cluster" "app" {
  name = "app"
}
