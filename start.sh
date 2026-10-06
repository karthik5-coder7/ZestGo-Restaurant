#!/bin/sh

echo "======================================"
echo "Starting FoodApp"
echo "Render PORT = ${PORT}"
echo "======================================"

PORT=${PORT:-8080}

echo "Configuring Tomcat to use port ${PORT}"

# Configure Tomcat HTTP connector.
# The address-strip is idempotent: on Render restarts this script runs again
# against an already-patched server.xml, and without it we would stack a
# second address="0.0.0.0" onto the connector, which makes Tomcat fail to
# parse its config ("Attribute \"address\" was already specified") and the
# service never binds its port.
sed -i "s/ address=\"[^\"]*\"//g; s/port=\"8080\"/port=\"${PORT}\" address=\"0.0.0.0\"/" \
    /usr/local/tomcat/conf/server.xml

# Disable Tomcat shutdown port
sed -i 's/port="8005"/port="-1"/' \
    /usr/local/tomcat/conf/server.xml

echo "Starting Tomcat..."

exec catalina.sh run