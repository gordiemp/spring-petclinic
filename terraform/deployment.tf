module "deployment-server" {
  source = "./deployment-server"

  ami-id = "ami-0742b4e673072066f" # AMI for an Amazon Linux instance for region: us-east-1

  iam-instance-profile = aws_iam_instance_profile.spring-petclinic.id
  key-pair             = aws_key_pair.spring-petclinic-key.key_name
  name                 = "Petclinic"
  device-index         = 0
  network-interface-id = aws_network_interface.spring-petclinic.id
  repository-url       = aws_ecr_repository.spring-petclinic.repository_url
}
