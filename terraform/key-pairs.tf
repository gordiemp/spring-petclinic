# SSH key - Web App

resource "aws_key_pair" "spring-petclinic-key" {
  key_name   = "spring-petclinic"
  public_key = file("./spring-petclinic.pem")
}

# SSH key - Jenkins

resource "aws_key_pair" "jenkins-key" {
  key_name   = "jenkins"
  public_key = file("./jenkins.pem")
}