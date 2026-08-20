#!/bin/sh

echo "======================================"
echo "Starting FoodApp"
echo "Render PORT = ${PORT}"
echo "======================================"

PORT=${PORT:-8080}

echo "Configuring Tomcat to use port ${PORT}"

# Configure Tomcat HTTP connector
sed -i "s/port=\"8080\"/port=\"${PORT}\" address=\"0.0.0.0\"/" \
    /usr/local/tomcat/conf/server.xml

# Disable Tomcat shutdown port
sed -i 's/port="8005"/port="-1"/' \
    /usr/local/tomcat/conf/server.xml

echo "Starting Tomcat..."

exec catalina.sh run