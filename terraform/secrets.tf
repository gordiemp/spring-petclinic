resource "aws_secretsmanager_secret" "spr-appvv6" {
  name = "spr-appvv6"
}

resource "aws_secretsmanager_secret_version" "spr-appvv6" {
  secret_id     = aws_secretsmanager_secret.spr-appvv6.id
  secret_string = jsonencode(var.secrets)
}
