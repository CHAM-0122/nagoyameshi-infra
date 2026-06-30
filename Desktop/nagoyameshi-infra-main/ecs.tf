resource "aws_ecs_cluster" "main" {
  name = "nagoyameshi-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "nagoyameshi-cluster"
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = "nagoyameshi-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "${aws_ecr_repository.main.repository_url}:latest"
      essential = true

      portMappings = [
        {
          containerPort = 80
          protocol      = "tcp"
        }
      ]

      environment = [
        {
          name  = "DB_HOST"
          value = aws_db_instance.main.address
        },
        {
          name  = "DB_NAME"
          value = "nagoyameshi"
        },
        {
          name  = "DB_USER"
          value = "admin"
        },
        {
          name  = "DB_PASSWORD"
          value = "Password123!"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/nagoyameshi"
          awslogs-region        = "ap-northeast-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_cloudwatch_log_group" "ecs" {
  name = "/ecs/nagoyameshi"
}

resource "aws_ecs_service" "prod" {
  name            = "nagoyameshi-prod-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = [
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.prod.arn
    container_name   = "app"
    container_port   = 80
  }

  depends_on = [
    aws_lb_listener.http
  ]
}