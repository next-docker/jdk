PARAM_UBUNTU_VERSION=$1
PARAM_JDK_VERSION=$2
PARAM_TOMCAT_VERSION=$3

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"
IFS='.' read -ra TOMCAT_VERSION_ARRAY <<< "$PARAM_TOMCAT_VERSION"

echo "FROM ping2ravi/jdk:${PARAM_JDK_VERSION}_ubuntu.${PARAM_UBUNTU_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"

echo ""
echo ""
echo "# Ubuntu ${PARAM_UBUNTU_VERSION}"
echo "# Java Version ${JDK_VERSION_ARRAY[0]} update ${JDK_VERSION_ARRAY[1]}"
echo "# Tomcat Version ${PARAM_TOMCAT_VERSION}" 
echo "#     https://tomcat.apache.org/download-${TOMCAT_VERSION_ARRAY[0]}0.cgi"

echo ""
echo ""
echo "ENV TOMCAT_VERSION $PARAM_TOMCAT_VERSION"

echo "ENV TOMCAT_HOME /opt/tomcat/tomcat-\${TOMCAT_VERSION}"
echo "ENV CATALINA_HOME /opt/tomcat/tomcat-\${TOMCAT_VERSION}"
echo "ENV TOMCAT_TGZ_URL http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION_ARRAY[0]}/v$PARAM_TOMCAT_VERSION/bin/apache-tomcat-$PARAM_TOMCAT_VERSION.tar.gz"
echo "ENV TOMCAT_FOLDER apache-tomcat-\${TOMCAT_VERSION}"

echo ""
echo "RUN apt-get install vim -y"
echo "RUN  wget -O tomcat.tar.gz \${TOMCAT_TGZ_URL} ; tar -xvf tomcat.tar.gz; mkdir -p \${CATALINA_HOME};mv \${TOMCAT_FOLDER}/* \${CATALINA_HOME}; rm tomcat.tar.gz; rm -fR \${TOMCAT_FOLDER} rm -fR \${CATALINA_HOME}\bin\*.bat"

echo ""
echo ""
echo "ENV PATH \${PATH}:\${CATALINA_HOME}/bin"
echo ""
echo ""
echo "EXPOSE 8080"
echo ""
echo ""

echo "CMD catalina.sh run" 

IFS=$OIFS
