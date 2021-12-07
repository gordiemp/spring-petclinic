# SSH key - Web App

resource "aws_key_pair" "spring-petclinic-key" {
  key_name   = "spring-petclinic"
  public_key = file("./spring-petclinic.pem")
}

<<<<<<< HEAD
=======

>>>>>>> 6efa5fa3e2d1cad0a234ae0484939eb4e74023dc
# SSH key - Jenkins

resource "aws_key_pair" "jenkins-key" {
  key_name   = "jenkins"
  public_key = file("./jenkins.pem")
<<<<<<< HEAD
}
=======
}
>>>>>>> 6efa5fa3e2d1cad0a234ae0484939eb4e74023dc
