# Use an official Tomcat image as the base image
FROM tomcat:9-jdk11-openjdk-slim

# Remove the existing Tomcat application
# RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from your local directory into the container at the Tomcat webapps directory
# COPY target/jenkinsExampleApp.war /usr/local/tomcat/webapps/jenkinsExampleApp.war

# Expose the port the Tomcat server will listen on
EXPOSE 9090
ADD target/jenkinsExampleApp.war jenkinsExampleApp.war
ENTRYPOINT ["java","-war","/jenkinsExampleApp.war"]

# Command to run the Tomcat server when the container starts
#CMD ["catalina.sh", "run"]
