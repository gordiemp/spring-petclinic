resource "aws_secretsmanager_secret" "maven13131fqff2221221" {
  name = "maven13131fqff2221221"
}

resource "aws_secretsmanager_secret_version" "maven13131fqff2221221" {
  secret_id     = aws_secretsmanager_secret.maven13131fqff2221221.id
  secret_string = jsonencode(var.secrets)
}
