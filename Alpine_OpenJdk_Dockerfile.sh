PARAM_ALPINE_VERSION=$1
PARAM_OPEN_JDK_VERSION=$2

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"


#JAVA_MAJOR_VERSION=${JDK_VERSION_ARRAY[0]}
#JAVA_MINOR_VERSION=${JDK_VERSION_ARRAY[1]}
#JAVA_BUILD_VERSION=${JDK_VERSION_ARRAY[2]}
#JAVA_DOWNLOAD_ID=${JDK_VERSION_ARRAY[3]}


echo "FROM ping2ravi/alpine:${PARAM_ALPINE_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"

echo ""
echo ""
echo "# Alpine ${PARAM_ALPINE_VERSION}"
echo "# Java Version ${PARAM_OPEN_JDK_VERSION}"
#echo "ENV JAVA_VERSION_MAJOR ${JAVA_MAJOR_VERSION}"
#echo "ENV JAVA_VERSION_MINOR ${JAVA_MINOR_VERSION}"
#echo "ENV JAVA_VERSION_BUILD ${JAVA_BUILD_VERSION}"
#echo "ENV JAVA_PACKAGE_NAME ${JAVA_PACKAGE_NAME}"


echo ""
echo ""
echo "ENV JAVA_BASE_DIR /opt/java"
echo "ENV JAVA_DIR ${PARAM_OPEN_JDK_VERSION}"
echo "ENV JAVA_HOME /opt/java/\${JAVA_DIR}"
echo ""
echo ""

if [ $PARAM_OPEN_JDK_VERSION == "jdk-14.0.1" ]
then
echo "ENV JAVA_DOWLOAD_URL https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_linux-x64_bin.tar.gz"
else
echo "ENV JAVA_DOWLOAD_URL https://download.java.net/java/early_access/alpine/10/binaries/open${PARAM_OPEN_JDK_VERSION}-ea+10_linux-x64-musl_bin.tar.gz"
fi



echo ""
echo ""
echo "RUN apk --update add curl ca-certificates tar" 
echo ""
#echo "RUN mkdir -p  \$JAVA_HOME;curl -jksSLH \"Cookie: oraclelicense=accept-securebackup-cookie\" \$JAVA_DOWLOAD_URL --output \${JAVA_BASE_DIR}/jdk.tar.gz; ls -lrt \${JAVA_BASE_DIR}"
echo "RUN mkdir -p  \$JAVA_HOME;curl \$JAVA_DOWLOAD_URL --output \${JAVA_BASE_DIR}/jdk.tar.gz; ls -lrt \${JAVA_BASE_DIR}"
echo "RUN ls -lrt /opt/java/; ls -lrt \$JAVA_HOME"
echo "RUN tar -xf \${JAVA_BASE_DIR}/jdk.tar.gz --directory \${JAVA_BASE_DIR};"
echo "RUN ls -lrt \${JAVA_BASE_DIR} "
echo "RUN ls -lrt \${JAVA_BASE_DIR}; ls -lrt \$JAVA_HOME; ls -lrth /var/cache/apk/; ls -lrt /tmp/"
echo "RUN rm -f \${JAVA_BASE_DIR}/jdk.tar.gz;"
echo "RUN rm -f \${JAVA_HOME}/*src.zip;rm -fR \${JAVA_HOME}/jre;rm -fR /tmp/* ; rm -fR /var/cache/apk/*;rm -fR $JAVA_HOME/legal"
echo "RUN ls -lrt /opt/java/; ls -lrt \$JAVA_HOME"
echo "RUN df -h; du -h -d 1 /opt/java/; echo check \$JAVA_HOME; du -h -d 1 \$JAVA_HOME; echo check temp; du -h -d 1 /tmp; du -h -d 1 /; ls -lrt \$JAVA_HOME"


echo "ENV PATH \${PATH}:\${JAVA_HOME}/bin"




IFS=$OIFS