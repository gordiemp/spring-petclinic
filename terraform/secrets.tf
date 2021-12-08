resource "aws_secretsmanager_secret" "maven13fqf222" {
  name = "maven13fqf222"
}

resource "aws_secretsmanager_secret_version" "maven13fqf222" {
  secret_id     = aws_secretsmanager_secret.maven13fqf222.id
  secret_string = jsonencode(var.secrets)
}
