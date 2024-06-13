# Use an official Tomcat image as the base image
FROM tomcat:9-jdk11-openjdk-slim

# Remove the existing Tomcat webapps to ensure a clean state
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from your local directory into the container at the Tomcat webapps directory
COPY target/jenkinsExampleApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/jenkinsExampleApp.war

# Expose the port the Tomcat server will listen on
EXPOSE 8080

# Command to run the Tomcat server when the container starts
CMD ["catalina.sh", "run"]
