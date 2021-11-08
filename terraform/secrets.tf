resource "aws_secretsmanager_secret" "secretsmav" {
  name = "secretsmav"
}

resource "aws_secretsmanager_secret_version" "secretsmav" {
  secret_id     = aws_secretsmanager_secret.secretsmav.id
  secret_string = jsonencode(var.secrets)
}

