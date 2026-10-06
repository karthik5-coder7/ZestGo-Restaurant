#!/bin/sh
# ============================================================
# ZestGo dev preview: builds the WAR and runs it on Tomcat.
# Used by the Freebuff preview runner (binds to $PORT).
# JDK lives outside the repository at /opt/java.
# ============================================================

set -e

JAVA_HOME=$(ls -d /opt/java/jdk-17* 2>/dev/null | head -1)
export JAVA_HOME
export PATH="$JAVA_HOME/bin:$PATH"

CATALINA_HOME=/opt/java/tomcat
PORT=${PORT:-8080}

echo "==> Building FoodApp.war from current sources"
sh ./scripts/build-war.sh

echo "==> Deploying FoodApp.war as ROOT app"
rm -rf "$CATALINA_HOME/webapps/ROOT"
rm -rf "$CATALINA_HOME/webapps/ROOT.war"
cp FoodApp.war "$CATALINA_HOME/webapps/ROOT.war"

echo "==> Configuring Tomcat on port $PORT"

# Idempotent: strip any address attrs already on the HTTP connector line,
# then set the port and add exactly one address attr. Safe on every rerun.
sed -i "s/ address=\"[^\"]*\"//g; s/port=\"8080\"/port=\"$PORT\" address=\"0.0.0.0\"/" \
    "$CATALINA_HOME/conf/server.xml"
sed -i 's/port="8005"/port="-1"/' \
    "$CATALINA_HOME/conf/server.xml"

echo "==> Starting Tomcat"
exec "$CATALINA_HOME/bin/catalina.sh" run
