resource "aws_secretsmanager_secret" "spr-appv4" {
  name = "spr-appv4"
}

resource "aws_secretsmanager_secret_version" "spr-appv4" {
  secret_id     = aws_secretsmanager_secret.spr-appv4.id
  secret_string = jsonencode(var.secrets)
}
