FROM ping2ravi/alpine:3.8


MAINTAINER Ravi Sharma


# Alpine 3.8
# Java Version 8 update 181 build 13
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 181
ENV JAVA_VERSION_BUILD 13
ENV JAVA_PACKAGE_NAME server-jre


ENV JAVA_BASE_DIR /opt/java
ENV JAVA_DIR 8.181.13
ENV JAVA_HOME /opt/java/${JAVA_DIR}


ENV JAVA_DOWLOAD_URL http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/server-jre-8u181-linux-x64.tar.gz


RUN apk --update add curl ca-certificates tar

RUN mkdir -p  $JAVA_HOME;curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" $JAVA_DOWLOAD_URL --output ${JAVA_BASE_DIR}/jdk.tar.gz; ls -lrt ${JAVA_BASE_DIR}
RUN ls -lrt /opt/java/; ls -lrt $JAVA_HOME
RUN tar -xf ${JAVA_BASE_DIR}/jdk.tar.gz --directory ${JAVA_BASE_DIR};
RUN ls -lrt ${JAVA_BASE_DIR} 
RUN mv ${JAVA_BASE_DIR}/jdk1.8.0_181/* ${JAVA_HOME} ;
RUN ls -lrt ${JAVA_BASE_DIR}; ls -lrt $JAVA_HOME
RUN rm -f ${JAVA_BASE_DIR}/jdk.tar.gz; rm -fR ${JAVA_BASE_DIR}/jdk1.8.0_181
RUN rm -f ${JAVA_HOME}/*src.zip;rm -fR ${JAVA_HOME}/jre;
RUN ls -lrt /opt/java/; ls -lrt $JAVA_HOME
