# 1. Our application is Java, so that we need JDK
FROM openjdk:17-jdk

# 2. We need to copy the jar file into the docker image we want to build.
# We copy the jar of our project into a folder named app in the docker container
COPY target/spring-jpa-0.0.1-SNAPSHOT.jar /app/spring_jpa.jar

# 3. We need now to package our application and make it ready to use
# 3.1. We expose the port of our application at the conatiner side
EXPOSE 8080

# 3.2 Specify commands to execute our jar file inside the container
CMD ["java -jar spring_jpa.jar"]