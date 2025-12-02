FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/Demo-Demo-1.0.0-jar-with-dependencies.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
