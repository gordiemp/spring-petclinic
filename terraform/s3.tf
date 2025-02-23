# S3 Bucket storing logs

resource "aws_s3_bucket" "spring-petclinic-logs" {
  bucket = "mhordienko-spring-petclinic-logs"
  acl    = "private"
}

# S3 Bucket storing jenkins user data

resource "aws_s3_bucket" "jenkins-config" {
  bucket = "mhordienko-jenkins-config"
  acl    = "private"
}

# To upload all the config files in the folder jenkins-config

resource "aws_s3_bucket_object" "jenkins-config" {
  bucket   = aws_s3_bucket.jenkins-config.id
  for_each = fileset("jenkins-config/", "*")
  key      = each.value
  source   = "jenkins-config/${each.value}"
  etag     = filemd5("jenkins-config/${each.value}")
}
