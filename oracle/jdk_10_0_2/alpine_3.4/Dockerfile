FROM ping2ravi/alpine:3.4


MAINTAINER Ravi Sharma


# Alpine 3.4
# Java Version 10 update 0 build 2
ENV JAVA_VERSION_MAJOR 10
ENV JAVA_VERSION_MINOR 0
ENV JAVA_VERSION_BUILD 2
ENV JAVA_PACKAGE_NAME serverjre


ENV JAVA_BASE_DIR /opt/java
ENV JAVA_DIR 10.0.2
ENV JAVA_HOME /opt/java/${JAVA_DIR}


ENV JAVA_DOWLOAD_URL http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/serverjre-10.0.2_linux-x64_bin.tar.gz


RUN apk --update add curl ca-certificates tar

RUN mkdir -p  $JAVA_HOME;curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" $JAVA_DOWLOAD_URL --output ${JAVA_BASE_DIR}/jdk.tar.gz; ls -lrt ${JAVA_BASE_DIR}
RUN ls -lrt /opt/java/; ls -lrt $JAVA_HOME
RUN tar -xf ${JAVA_BASE_DIR}/jdk.tar.gz --directory ${JAVA_BASE_DIR};
RUN ls -lrt ${JAVA_BASE_DIR} 
RUN mv ${JAVA_BASE_DIR}/jdk-10.0.2/* ${JAVA_HOME} ;
RUN ls -lrt ${JAVA_BASE_DIR}; ls -lrt $JAVA_HOME
RUN rm -f ${JAVA_BASE_DIR}/jdk.tar.gz; rm -fR ${JAVA_BASE_DIR}/jdk-10.0.2
RUN rm -f ${JAVA_HOME}/*src.zip;rm -fR ${JAVA_HOME}/jre;
RUN ls -lrt /opt/java/; ls -lrt $JAVA_HOME
