<<<<<<< HEAD
resource "aws_secretsmanager_secret" "maven13f" {
  name = "maven13f"
}

resource "aws_secretsmanager_secret_version" "maven13f" {
  secret_id     = aws_secretsmanager_secret.maven13f.id
  secret_string = jsonencode(var.secrets)
}

=======
resource "aws_secretsmanager_secret" "spr-aa8" {
  name = "spr-aa8"
}

resource "aws_secretsmanager_secret_version" "spr-aa8" {
  secret_id     = aws_secretsmanager_secret.spr-aa8.id
  secret_string = jsonencode(var.secrets)
}
>>>>>>> 6efa5fa3e2d1cad0a234ae0484939eb4e74023dc
