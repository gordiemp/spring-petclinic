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

pipeline {   
  agent any
  stages {
    stage("Set Up") {
      steps {
        echo "Logging into the private AWS Elastic Container Registry" 
        script {
          // Set environment variables
          GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
          REPOSITORY = sh (script: "cat \$HOME/opt/repository_url", returnStdout: true)
          REPOSITORY_TEST = sh (script: "cat \$HOME/opt/repository_test_url", returnStdout: true)
          REPOSITORY_STAGING = sh (script: "cat \$HOME/opt/repository_staging_url", returnStdout: true)
          INSTANCE_ID = sh (script: "cat \$HOME/opt/instance_id", returnStdout: true)
          S3_LOGS = sh (script: "cat \$HOME/opt/bucket_name", returnStdout: true)
          DATE_NOW = sh (script: "date +%Y%m%d", returnStdout: true)
    

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
    stage("Build Test Image") {
      steps {
        echo 'Start building the project docker image for tests' 
        script {
          testImage = docker.build("$REPOSITORY_TEST:$GIT_COMMIT_HASH", "-f ./Dockerfile.test .")
          testImage.push()
        } 
      }
    }
    stage("Run Load Balancing tests / Security Checks") {
      steps {
        echo 'Run load balancing tests and security checks'
        script {
          testImage.withRun('-p 8000:8000 -u root'){
            sh """
            # run arachni to check for common vulnerabilities
            \$HOME/opt/arachni-1.5.1-0.5.12/bin/arachni http://\$(hostname):8000 --check=xss,code_injection --report-save-path=simple-web-app.com.afr
            # Save report in html (zipped)
            \$HOME/opt/arachni-1.5.1-0.5.12/bin/arachni_reporter simple-web-app.com.afr --reporter=html:outfile=arachni_report.html.zip
            """
          }
          // Upload the Arachni tests' results to S3  
          sh "aws s3 cp ./arachni_report.html.zip s3://$S3_LOGS/$DATE_NOW/$GIT_COMMIT_HASH/"
        }
      }
    }
    stage("Deploy to Fixed Server") {
      steps {
        echo 'Deploy release to production'
        script {
          productionImage = docker.build("$REPOSITORY:release")
          productionImage.push()
          sh "aws ec2 reboot-instances --region us-east-1 --instance-ids $INSTANCE_ID"
        }
      }
    }
    stage("Clean Up") {
      steps {
        echo 'Clean up local docker images'
        script {
          sh """
          # Change the :latest with the current ones
          docker tag $REPOSITORY_TEST:$GIT_COMMIT_HASH  $REPOSITORY_TEST:latest
          docker tag $REPOSITORY_STAGING:$GIT_COMMIT_HASH  $REPOSITORY_STAGING:latest
          docker tag $REPOSITORY:release  $REPOSITORY:latest
          # Remove the images
          docker image rm $REPOSITORY_TEST:$GIT_COMMIT_HASH
          docker image rm $REPOSITORY_STAGING:$GIT_COMMIT_HASH
          docker image rm $REPOSITORY:release
          # Remove dangling images
          docker image prune -f
          """
        }
        echo 'Clean up config.json file with ECR Docker Credentials'
        script {
          sh """
          rm $HOME/.docker/config.json
          """
        }
      }
    }
  }
}