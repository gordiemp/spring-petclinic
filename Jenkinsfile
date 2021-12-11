
pipeline{
agent any
  environment {
    registry = "zelenjyslonik/spring-petclinic"
    registryCredential = 'docker-hub'
    dockerImage = ''
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/gordiemp/spring-petclinic.git'
      }
    }
    stage('Building Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":latest"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:latest"
      }
    }
  }
}