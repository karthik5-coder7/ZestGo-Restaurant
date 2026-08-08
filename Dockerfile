FROM tomcat:9-jdk17

COPY FoodApp.war /usr/local/tomcat/webapps/FoodApp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]