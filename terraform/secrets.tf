resource "aws_secretsmanager_secret" "maven13fqf221" {
  name = "maven13fqf221"
}

resource "aws_secretsmanager_secret_version" "maven13fqf221" {
  secret_id     = aws_secretsmanager_secret.maven13fqf221.id
  secret_string = jsonencode(var.secrets)
}
