FROM tomcat:9-jdk17

# Remove Tomcat default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Deploy your application as ROOT
COPY FoodApp.war /usr/local/tomcat/webapps/ROOT.war

# Bind Tomcat to all interfaces
RUN sed -i 's/port="8080"/port="8080" address="0.0.0.0"/' \
    /usr/local/tomcat/conf/server.xml

# Disable Tomcat shutdown port
RUN sed -i 's/port="8005"/port="-1"/' \
    /usr/local/tomcat/conf/server.xml

# Startup script
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]