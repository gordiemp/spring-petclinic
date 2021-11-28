pipeline {
  agent none
  stages {
    stage("Build") {
    agent {docker 'maven:3.6-jdk-11-slim'} 
      steps {
        echo "Hello maven" 
        sh 'mvn -B -DskipTests clean package'
      }
    }
    stage ("Run") {
      agent { docker 'openjdk:11.0.1-jre-slim-stretch' } 
      steps {
          echo 'Hello, JDK'
          sh 'java -jar target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar'
    }
    stage ("Push") {
      steps{
        echo 'Unlock PaX'
        sh 'sysctl -w kernel.pax.softmode=1'
      }
    }
}
}
}