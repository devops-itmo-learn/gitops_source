# Build image
FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

COPY . .

RUN chmod +x ./gradlew \
    && ./gradlew bootJar

# Final image
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN apk add --no-cache curl

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD sh -c "curl -fsS http://localhost:8080/healthz || curl -fsS http://localhost:8080/api/hello || exit 1"

ENTRYPOINT ["java", "-jar", "/app/app.jar"]