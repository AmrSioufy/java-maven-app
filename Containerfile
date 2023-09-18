# Use an official OpenJDK runtime as a parent image
FROM docker.io/brody/openjdk17-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the JAR file into the container at /app
COPY ./target/*.jar ./app.jar

# Define the command to run your application when the container starts
CMD ["java", "-jar", "app.jar"]
