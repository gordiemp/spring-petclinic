resource "aws_secretsmanager_secret" "springap" {
  name = "springap"
}

resource "aws_secretsmanager_secret_version" "springap" {
  secret_id     = aws_secretsmanager_secret.springap.id
  secret_string = jsonencode(var.secrets)
}

