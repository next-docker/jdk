PARAM_ALPINE_VERSION=$1
PARAM_JDK_VERSION=$2

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"


JAVA_MAJOR_VERSION=${JDK_VERSION_ARRAY[0]}
JAVA_MINOR_VERSION=${JDK_VERSION_ARRAY[1]}
JAVA_BUILD_VERSION=${JDK_VERSION_ARRAY[2]}
JAVA_DOWNLOAD_ID=${JDK_VERSION_ARRAY[3]}
if [ $JAVA_MAJOR_VERSION == "10" ]
then
JAVA_PACKAGE_NAME=serverjre
JAVA_UNARCHIVE_DIR=jdk-${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}.${JAVA_BUILD_VERSION}
else
JAVA_PACKAGE_NAME=server-jre
JAVA_UNARCHIVE_DIR=jdk1.${JAVA_MAJOR_VERSION}.0_${JAVA_MINOR_VERSION}
fi


echo "FROM ping2ravi/alpine:${PARAM_ALPINE_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"

echo ""
echo ""
echo "# Alpine ${PARAM_ALPINE_VERSION}"
echo "# Java Version ${JDK_VERSION_ARRAY[0]} update ${JDK_VERSION_ARRAY[1]} build ${JDK_VERSION_ARRAY[2]}"
echo "ENV JAVA_VERSION_MAJOR ${JAVA_MAJOR_VERSION}"
echo "ENV JAVA_VERSION_MINOR ${JAVA_MINOR_VERSION}"
echo "ENV JAVA_VERSION_BUILD ${JAVA_BUILD_VERSION}"
echo "ENV JAVA_PACKAGE_NAME ${JAVA_PACKAGE_NAME}"


echo ""
echo ""
echo "ENV JAVA_BASE_DIR /opt/java"
echo "ENV JAVA_DIR ${JDK_VERSION_ARRAY[0]}.${JDK_VERSION_ARRAY[1]}.${JDK_VERSION_ARRAY[2]}"
echo "ENV JAVA_HOME /opt/java/\${JAVA_DIR}"
echo ""
echo ""
#http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/server-jre-8u181-linux-x64.tar.gz

if [ $JAVA_MAJOR_VERSION == "10" ]
then
   echo "ENV JAVA_DOWLOAD_URL http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}.${JAVA_BUILD_VERSION}+13/${JAVA_DOWNLOAD_ID}/${JAVA_PACKAGE_NAME}-${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}.${JAVA_BUILD_VERSION}_linux-x64_bin.tar.gz" 
else
   echo "ENV JAVA_DOWLOAD_URL http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}u${JAVA_MINOR_VERSION}-b${JAVA_BUILD_VERSION}/${JAVA_DOWNLOAD_ID}/${JAVA_PACKAGE_NAME}-${JAVA_MAJOR_VERSION}u${JAVA_MINOR_VERSION}-linux-x64.tar.gz"
fi


echo ""
echo ""
echo "RUN apk --update add curl ca-certificates tar" 
echo ""
echo "RUN mkdir -p  \$JAVA_HOME;curl -jksSLH \"Cookie: oraclelicense=accept-securebackup-cookie\" \$JAVA_DOWLOAD_URL --output \${JAVA_BASE_DIR}/jdk.tar.gz; ls -lrt \${JAVA_BASE_DIR}"
echo "RUN ls -lrt /opt/java/; ls -lrt \$JAVA_HOME"
echo "RUN tar -xf \${JAVA_BASE_DIR}/jdk.tar.gz --directory \${JAVA_BASE_DIR};"
echo "RUN ls -lrt \${JAVA_BASE_DIR} "
echo "RUN mv \${JAVA_BASE_DIR}/${JAVA_UNARCHIVE_DIR}/* \${JAVA_HOME} ;"
echo "RUN ls -lrt \${JAVA_BASE_DIR}; ls -lrt \$JAVA_HOME; ls -lrth /var/cache/apk/; ls -lrt /tmp/"
echo "RUN rm -f \${JAVA_BASE_DIR}/jdk.tar.gz; rm -fR \${JAVA_BASE_DIR}/${JAVA_UNARCHIVE_DIR}"
echo "RUN rm -f \${JAVA_HOME}/*src.zip;rm -fR \${JAVA_HOME}/jre;rm -fR /tmp/* ; rm -fR /var/cache/apk/*"
echo "RUN ls -lrt /opt/java/; ls -lrt \$JAVA_HOME"

echo "ENV PATH \${PATH}:\${JAVA_HOME}/bin"



IFS=$OIFS
