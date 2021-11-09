resource "aws_secretsmanager_secret" "secretmav" {
  name = "secretmav"
}

resource "aws_secretsmanager_secret_version" "secretmav" {
  secret_id     = aws_secretsmanager_secret.secretmav.id
  secret_string = jsonencode(var.secrets)
}

