#Build stage
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#Package stage
FROM openjdk:11-jre-slim
EXPOSE 8181
COPY  --from=build /home/app/target/spring-petclinic-2.5.0-SNAPSHOT.jar /usr/local/lib/spring-petclinic-2.5.0-SNAPSHOT.jar 
ENTRYPOINT ["java","-jar","/usr/local/lib/spring-petclinic-2.5.0-SNAPSHOT.jar", "-Dserver.port=8181"]
