resource "aws_instance" "default" {
<<<<<<< HEAD

=======
>>>>>>> 6efa5fa3e2d1cad0a234ae0484939eb4e74023dc
  ami = var.ami-id
  iam_instance_profile = var.iam-instance-profile
  instance_type = var.instance-type
  key_name = var.key-pair
  network_interface {
    device_index = var.device-index
    network_interface_id = var.network-interface-id
  }

<<<<<<< HEAD
  user_data = templatefile( 
  "${path.module}/user_data.sh", 
  
  {    
  repository_url = var.repository-url,    
  repository_test_url = var.repository-test-url,    
  repository_staging_url = var.repository-staging-url,    
  instance_id = var.instance-id,    
  bucket_logs_name = var.bucket-logs-name,    
  public_dns = var.public-dns,    
  admin_username = var.admin-username,    
  admin_password = var.admin-password,    
  admin_fullname = var.admin-fullname,    
  admin_email = var.admin-email,    
  remote_repo = var.remote-repo,    
  job_name = var.job-name,    
  job_id = var.job-id,    
  bucket_config_name = var.bucket-config-name,
  }
)
  tags = {
    Name = var.name
  }
}
=======
  user_data = templatefile(
    "${path.module}/user_data.sh", 
    {
      repository_url = var.repository-url, 
      repository_test_url = var.repository-test-url,
      repository_staging_url = var.repository-staging-url,
      instance_id = var.instance-id,
      bucket_logs_name = var.bucket-logs-name,
      public_dns = var.public-dns,
      admin_username = var.admin-username,
      admin_password = var.admin-password,
      admin_fullname = var.admin-fullname,
      admin_email = var.admin-email,
      remote_repo = var.remote-repo,
      job_name = var.job-name,
      job_id = var.job-id,
      bucket_config_name = var.bucket-config-name
    }
  )

  tags = {
    Name = var.name
  }
}
>>>>>>> 6efa5fa3e2d1cad0a234ae0484939eb4e74023dc
