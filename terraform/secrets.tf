resource "aws_secretsmanager_secret" "maven13f" {
  name = "maven13f"
}

resource "aws_secretsmanager_secret_version" "maven13f" {
  secret_id     = aws_secretsmanager_secret.maven13f.id
  secret_string = jsonencode(var.secrets)
}

