resource "aws_secretsmanager_secret" "spr-appv6" {
  name = "spr-appv6"
}

resource "aws_secretsmanager_secret_version" "spr-appv6" {
  secret_id     = aws_secretsmanager_secret.spr-appv6.id
  secret_string = jsonencode(var.secrets)
}
