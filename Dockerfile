# Use a multi-stage build to keep the final image lightweight
# Stage 1: Build
FROM openjdk:latest AS build
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# Stage 2: Run
FROM openjdk:latest
ARG JAR_FILE=target/*.jar
COPY --from=build ${JAR_FILE} app.jar

# Define environment variables
ENV JAVA_OPTS=-Xmx512m -Xms256m
ENV APP_LOG_LEVEL=INFO

# Create a non-root user and group
RUN groupadd -r appgroup && useradd -r -g appgroup -G appgroup -m appuser
USER appuser

# Set the working directory and copy the jar file
WORKDIR /app
COPY --from=build ${JAR_FILE} app.jar

# Expose the port and define the entry point
EXPOSE 9096
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Define volumes for logs and data
VOLUME /app/logs
VOLUME /app/data

# Optional: Health check to verify the service is running
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:9096/actuator/health || exit 1