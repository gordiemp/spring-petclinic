resource "aws_secretsmanager_secret" "spr-aa8" {
  name = "spr-aa8"
}

resource "aws_secretsmanager_secret_version" "spr-aa8" {
  secret_id     = aws_secretsmanager_secret.spr-aa8.id
  secret_string = jsonencode(var.secrets)
}
