resource "aws_secretsmanager_secret" "maven13fqf222121" {
  name = "maven13fqf222121"
}

resource "aws_secretsmanager_secret_version" "maven13fqf222121" {
  secret_id     = aws_secretsmanager_secret.maven13fqf222121.id
  secret_string = jsonencode(var.secrets)
}
