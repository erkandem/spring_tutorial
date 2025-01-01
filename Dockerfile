# Use a base image with Maven and JDK pre-installed
FROM maven:3.8.8-eclipse-temurin-17 as builder

# Set the working directory
WORKDIR /app

# Copy only the pom.xml file first
COPY pom.xml .

# Download dependencies (caches Maven dependencies)
RUN mvn dependency:go-offline -B

# Copy the source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory for the runtime
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the port Spring Boot runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
