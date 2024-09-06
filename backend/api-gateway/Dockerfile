FROM maven:3.9.9-amazoncorretto-17 AS build

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN mvn package -q -Dspring.profiles.active="prod"

FROM amazoncorretto:17-alpine3.19

WORKDIR /app

COPY --from=build /build/target/api-gateway-1.0.jar /app/

ENTRYPOINT ["java", "-jar", "api-gateway-1.0.jar"]