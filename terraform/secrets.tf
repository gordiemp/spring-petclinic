resource "aws_secretsmanager_secret" "mavens131113131fqqff2221221" {
  name = "mavens131113131fqqff2221221"
}

resource "aws_secretsmanager_secret_version" "mavens131113131fqqff2221221" {
  secret_id     = aws_secretsmanager_secret.mavens131113131fqqff2221221.id
  secret_string = jsonencode(var.secrets)
}
