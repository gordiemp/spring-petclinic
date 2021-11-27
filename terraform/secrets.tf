resource "aws_secretsmanager_secret" "spr-appv2" {
  name = "spr-appv2"
}

resource "aws_secretsmanager_secret_version" "spr-appv2" {
  secret_id     = aws_secretsmanager_secret.spr-appv2.id
  secret_string = jsonencode(var.secrets)
}
