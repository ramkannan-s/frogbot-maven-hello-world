FROM proservices.jfrog.io/docker-pipelines-demo-1/maven:3.8.7-openjdk-18-slim AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package


FROM openjdk
COPY --from=build /usr/src/app/target/ramlab_hello-1.0.1.jar /usr/app/
RUN ls -lsa /usr/app/
