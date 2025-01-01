# Use a base image with Maven and JDK pre-installed
FROM maven:3.8.8-eclipse-temurin-17 as builder

# Set the working directory
WORKDIR /app

# Copy the project files to the working directory
COPY . .

# Build the Spring Boot application
RUN mvn clean package -DskipTests

# Use a lightweight base image for runtime
FROM eclipse-temurin:17-jdk-jammy

# Set the working directory for the runtime
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/landingpage-0.0.1-SNAPSHOT.jar app.jar

# Expose the port Spring Boot runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
