resource "aws_secretsmanager_secret" "spr-aa7" {
  name = "spr-aa7"
}

resource "aws_secretsmanager_secret_version" "spr-aa7" {
  secret_id     = aws_secretsmanager_secret.spr-aa7.id
  secret_string = jsonencode(var.secrets)
}
