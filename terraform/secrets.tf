resource "aws_secretsmanager_secret" "spr-appv1" {
  name = "spr-appv1"
}

resource "aws_secretsmanager_secret_version" "spr-appv1" {
  secret_id     = aws_secretsmanager_secret.spr-appv1.id
  secret_string = jsonencode(var.secrets)
}
