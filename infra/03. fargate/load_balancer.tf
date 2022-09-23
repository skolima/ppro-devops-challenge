resource "aws_lb_target_group" "ppro_devops_service" {
  name        = "ppro-devops-service"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.app_vpc.id

  health_check {
    enabled = true
    path    = "/healthz"
  }

  depends_on = [aws_alb.ppro_devops_service]
}

resource "aws_alb" "ppro_devops_service" {
  name               = "ppro-devops-service-lb"
  internal           = false
  load_balancer_type = "application"

  subnets = [
    aws_subnet.public_d.id,
    aws_subnet.public_e.id,
  ]

  security_groups = [
    aws_security_group.http.id,
    aws_security_group.https.id,
    aws_security_group.egress_all.id,
  ]

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_alb_listener" "ppro_devops_service_http" {
  load_balancer_arn = aws_alb.ppro_devops_service.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ppro_devops_service.arn
  }
}

output "alb_url_http" {
  value = "http://${aws_alb.ppro_devops_service.dns_name}"
}