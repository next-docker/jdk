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


echo "ENV JAVA_DOWLOAD_URL https://download.java.net/java/early_access/alpine/10/binaries/open${PARAM_OPEN_JDK_VERSION}-ea+10_linux-x64-musl_bin.tar.gz"


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







IFS=$OIFS
#
#
#ENV JAVA_HOME /opt/openjdk-15
#ENV PATH $JAVA_HOME/bin:$PATH
#
## https://jdk.java.net/
## > Java Development Kit builds, from Oracle
#ENV JAVA_VERSION 15-ea+10
#ENV JAVA_URL https://download.java.net/java/early_access/alpine/10/binaries/openjdk-15-ea+10_linux-x64-musl_bin.tar.gz
#ENV JAVA_SHA256 15a5e8002e24ed129b82bfe55ffe4bdbf3cfd0a7e5ad3399879cdd44175bfd06
## "For Alpine Linux, builds are produced on a reduced schedule and may not be in sync with the other platforms."
#
#RUN set -eux; \
#	\
#	wget -O /openjdk.tgz "$JAVA_URL"; \
#	echo "$JAVA_SHA256 */openjdk.tgz" | sha256sum -c -; \
#	mkdir -p "$JAVA_HOME"; \
#	tar --extract --file /openjdk.tgz --directory "$JAVA_HOME" --strip-components 1; \
#	rm /openjdk.tgz; \
#	\
## https://github.com/docker-library/openjdk/issues/212#issuecomment-420979840
## https://openjdk.java.net/jeps/341
#	java -Xshare:dump; \
#	\
## basic smoke test
#	java --version; \
#	javac --version
#
## https://docs.oracle.com/javase/10/tools/jshell.htm
## https://docs.oracle.com/javase/10/jshell/
## https://en.wikipedia.org/wiki/JShell
#CMD ["jshell"]
#© 2020 GitHub, Inc.