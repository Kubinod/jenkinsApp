# Use an official Tomcat image as the base image
FROM tomcat:9-jdk11-openjdk-slim

# Copy the WAR file from your local directory into the container at the Tomcat webapps directory
COPY target/jenkinsExampleApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/jenkinsExampleApp.war

# Expose the port the Tomcat server will listen on
EXPOSE 9090

# Change Tomcat's port to 9090
RUN sed -i 's/port="8080"/port="9095"/' /usr/local/tomcat/conf/server.xml

# Command to run the Tomcat server when the container starts
CMD ["catalina.sh", "run"]
# Run the JAR file
#ENTRYPOINT ["java", "-war", "jenkinsExampleApp.jar"]

CMD ["startup.sh", "run"]
