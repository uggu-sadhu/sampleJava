FROM maven:3.6.3-jdk-8 AS build
RUN mkdir /work
COPY . /work
RUN mvn -f /work/pom.xml clean package

FROM openjdk:8
COPY --from=build /work/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
