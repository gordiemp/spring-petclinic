resource "aws_secretsmanager_secret" "maven13fqf2212" {
  name = "maven13fqf2212"
}

resource "aws_secretsmanager_secret_version" "maven13fqf2212" {
  secret_id     = aws_secretsmanager_secret.maven13fqf2212.id
  secret_string = jsonencode(var.secrets)
}
