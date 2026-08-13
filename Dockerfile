FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY FoodApp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 10000

CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-10000}\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]