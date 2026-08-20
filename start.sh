#!/bin/sh

echo "======================================"
echo "Starting FoodApp"
echo "Render PORT = ${PORT:-8080}"
echo "======================================"

# Use Render's PORT.
# If PORT is not provided, use 8080.
TOMCAT_PORT=${PORT:-8080}

echo "Configuring Tomcat to use port $TOMCAT_PORT"

sed -i "s/port=\"8080\"/port=\"$TOMCAT_PORT\" address=\"0.0.0.0\"/" \
    /usr/local/tomcat/conf/server.xml

echo "Starting Tomcat..."

exec catalina.sh run