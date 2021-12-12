resource "aws_secretsmanager_secret" "maven13111311fqqff2221221" {
  name = "maven13111311fqqff2221221"
}

resource "aws_secretsmanager_secret_version" "maven13111311fqqff2221221" {
  secret_id     = aws_secretsmanager_secret.maven13111311fqqff2221221.id
  secret_string = jsonencode(var.secrets)
}
