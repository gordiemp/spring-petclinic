#Package stage
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/spring-petclinic-2.5.0-SNAPSHOT.jar /usr/local/lib/spring-petclinic-2.5.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar, --port=8000"]
