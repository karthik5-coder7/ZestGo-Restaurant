#!/bin/sh
# ============================================================
# ZestGo build script: compiles Java sources and packages
# FoodApp.war (used by GitHub Actions and locally).
#
# Requirements: JDK 17+ (javac, jar), GNU cp/find.
# The servlet API jar is expected at
#   .github/build-tools/javax.servlet-api-4.0.1.jar
# (the CI workflow downloads it; it must NOT end up in the WAR).
# ============================================================

set -e

cd "$(dirname "$0")"

SERVLET_JAR=".github/build-tools/javax.servlet-api-4.0.1.jar"

if [ ! -f "$SERVLET_JAR" ]; then
    echo "ERROR: $SERVLET_JAR not found."
    echo "Download it with:"
    echo "  curl -L -o $SERVLET_JAR \\"
    echo "    https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar"
    exit 1
fi

echo "==> Cleaning previous build output"
rm -rf build/classes build/war
mkdir -p build/classes build/war

echo "==> Compiling Java sources (JDK 17)"
find src/main/java -name '*.java' > build/sources.list

javac --release 17 \
      -encoding UTF-8 \
      -classpath "$SERVLET_JAR:src/main/webapp/WEB-INF/lib/*" \
      -d build/classes \
      @build/sources.list

echo "==> Assembling WAR contents"
cp -r src/main/webapp/. build/war/
mkdir -p build/war/WEB-INF/classes
cp -r build/classes/. build/war/WEB-INF/classes/

echo "==> Packaging FoodApp.war"
rm -f FoodApp.war
cd build/war
jar -cf ../../FoodApp.war .
cd ../..

echo "==> Done: FoodApp.war refreshed from current sources"
