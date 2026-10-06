FROM tomcat:9-jdk17

# Remove Tomcat default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Deploy FoodApp as ROOT application
COPY FoodApp.war /usr/local/tomcat/webapps/ROOT.war

# Copy startup script
COPY start.sh /start.sh

# Give execute permission
RUN chmod +x /start.sh

# Render exposes the PORT environment variable
EXPOSE 8080

# Start FoodApp
CMD ["/start.sh"]