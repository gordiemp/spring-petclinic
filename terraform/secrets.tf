resource "aws_secretsmanager_secret" "mavenssecret1" {
  name = "mavenssecret1"
}

resource "aws_secretsmanager_secret_version" "mavenssecret1" {
  secret_id     = aws_secretsmanager_secret.mavenssecret1.id
  secret_string = jsonencode(var.secrets)
}
