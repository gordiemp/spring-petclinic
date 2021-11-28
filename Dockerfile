FROM maven:3.6-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn clean package

FROM openjdk:11.0.1-jre-slim-stretch
EXPOSE 8181
WORKDIR /app
ARG JAR=spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar

COPY --from=BUILD /src/target/$JAR /app.jar
CMD ["java","-jar","/app.jar"]