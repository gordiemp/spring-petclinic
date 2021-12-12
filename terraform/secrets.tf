resource "aws_secretsmanager_secret" "maven1311311fqff2221221" {
  name = "maven1311311fqff2221221"
}

resource "aws_secretsmanager_secret_version" "maven1311311fqff2221221" {
  secret_id     = aws_secretsmanager_secret.maven1311311fqff2221221.id
  secret_string = jsonencode(var.secrets)
}
