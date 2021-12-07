resource "aws_secretsmanager_secret" "maven13ff" {
  name = "maven13ff"
}

resource "aws_secretsmanager_secret_version" "maven13ff" {
  secret_id     = aws_secretsmanager_secret.maven13ff.id
  secret_string = jsonencode(var.secrets)
}
