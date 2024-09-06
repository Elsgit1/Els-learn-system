# Use the latest version of Maven with Amazon Corretto for the build stage
FROM maven:3.9.9-amazoncorretto-17 AS build

# Set the working directory inside the container
WORKDIR /build

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -q

# Copy the source code and build the application
COPY src ./src
RUN mvn package -q -Dspring.profiles.active="prod"

# Use the latest version of Amazon Corretto with Alpine for the final container
FROM amazoncorretto:17-alpine3.19

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /build/target/subject-service-1.0.jar .

# Expose the application port (if needed)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "subject-service-1.0.jar"]
