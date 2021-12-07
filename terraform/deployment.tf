module "deployment-server" {
  source = "./deployment-server"

  ami-id = "ami-0742b4e673072066f" # AMI for an Amazon Linux instance for region: us-east-1

  iam-instance-profile = aws_iam_instance_profile.spring-petclinic.id
  key-pair             = aws_key_pair.spring-petclinic-key.key_name
<<<<<<< HEAD
  name                 = "Petclinic"
=======
  name                 = "Spring Petclinic"
>>>>>>> 6efa5fa3e2d1cad0a234ae0484939eb4e74023dc
  device-index         = 0
  network-interface-id = aws_network_interface.spring-petclinic.id
  repository-url       = aws_ecr_repository.spring-petclinic.repository_url
}
