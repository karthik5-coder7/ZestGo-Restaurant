FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY FoodApp.war /usr/local/tomcat/webapps/ROOT.war

# Configure Tomcat HTTP connector for Render
RUN sed -i 's/port="8080"/port="10000" address="0.0.0.0"/' /usr/local/tomcat/conf/server.xml

EXPOSE 10000

CMD ["catalina.sh", "run"]