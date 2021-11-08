def testImage
def stagingImage
def productionImage
def REPOSITORY
def REPOSITORY_TEST
def RESPOSITORY_STAGING
def GIT_COMMIT_HASH
def INSTANCE_ID
def ACCOUNT_REGISTRY_PREFIX
def S3_LOGS
def DATE_NOW
def SLACK_TOKEN
def CHANNEL_ID = "<YOUR_CHANNEL_ID>"

pipeline {
  agent any
  stages {
    stage("Set Up") {
      steps {
        echo "Logging into the private AWS Elastic Container Registry" 
        script {
          GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
          REPOSITORY = sh (script: "cat \$HOME/opt/repository_url", returnStdout: true)
          REPOSITORY_TEST = sh (script: "cat \$HOME/opt/repository_test_url", returnStdout: true)
          REPOSITORY_STAGING = sh (script: "cat \$HOME/opt/repository_staging_url", returnStdout: true)
          INSTANCE_ID = sh (script: "cat \$HOME/opt/instance_id", returnStdout: true)
          S3_LOGS = sh (script: "cat \$HOME/opt/bucket_name", returnStdout: true)
          DATE_NOW = sh (script: "date +%Y%m%d", returnStdout: true)
          
          // To parse and extract the Slack Token from the JSON response of AWS
          SLACK_TOKEN = sh (script: "python -c \"import sys;import json;print(json.loads(json.loads(raw_input())['SecretString'])['slackToken'])\" <<< \$(aws secretsmanager get-secret-value --secret-id simple-web-app --region us-east-1)", returnStdout: true)

          REPOSITORY = REPOSITORY.trim()
          REPOSITORY_TEST = REPOSITORY_TEST.trim()
          REPOSITORY_STAGING = REPOSITORY_STAGING.trim()
          S3_LOGS = S3_LOGS.trim()
          DATE_NOW = DATE_NOW.trim()

          ACCOUNT_REGISTRY_PREFIX = (REPOSITORY.split("/"))[0]
          
          // Log into ECR
          sh """
          /bin/sh -e -c 'echo \$(aws ecr get-login-password --region us-east-1)  | docker login -u AWS --password-stdin $ACCOUNT_REGISTRY_PREFIX'
          """
        } 
      }
    }
    stage("SCM Checkout") {
      steps {
        git 'https://github.com/gordiemp/spring-petclinic.git'
        }
        }
    stage('Compile-Package'){
      sh 'mvn package'
    } 
    }
    }

