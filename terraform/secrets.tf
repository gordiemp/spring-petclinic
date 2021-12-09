resource "aws_secretsmanager_secret" "maven13fqf22212" {
  name = "maven13fqf22212"
}

resource "aws_secretsmanager_secret_version" "maven13fqf22212" {
  secret_id     = aws_secretsmanager_secret.maven13fqf22212.id
  secret_string = jsonencode(var.secrets)
}
