FROM ping2ravi/alpine:3.10


MAINTAINER Ravi Sharma


# Alpine 3.10
# Java Version jdk-14.0.1


ENV JAVA_BASE_DIR /opt/java
ENV JAVA_DIR jdk-14.0.1
ENV JAVA_HOME /opt/java/${JAVA_DIR}


ENV JAVA_DOWLOAD_URL https://download.java.net/java/early_access/alpine/10/binaries/openjdk-14.0.1-ea+10_linux-x64-musl_bin.tar.gz


RUN apk --update add curl ca-certificates tar

RUN mkdir -p  $JAVA_HOME;curl $JAVA_DOWLOAD_URL --output ${JAVA_BASE_DIR}/jdk.tar.gz; ls -lrt ${JAVA_BASE_DIR}
RUN ls -lrt /opt/java/; ls -lrt $JAVA_HOME
RUN tar -xf ${JAVA_BASE_DIR}/jdk.tar.gz --directory ${JAVA_BASE_DIR};
RUN ls -lrt ${JAVA_BASE_DIR} 
RUN ls -lrt ${JAVA_BASE_DIR}; ls -lrt $JAVA_HOME; ls -lrth /var/cache/apk/; ls -lrt /tmp/
RUN rm -f ${JAVA_BASE_DIR}/jdk.tar.gz;
RUN rm -f ${JAVA_HOME}/*src.zip;rm -fR ${JAVA_HOME}/jre;rm -fR /tmp/* ; rm -fR /var/cache/apk/*;rm -fR /home/ravi/work/tools/java/current/legal
RUN ls -lrt /opt/java/; ls -lrt $JAVA_HOME
RUN df -h; du -h -d 1 /opt/java/; echo check $JAVA_HOME; du -h -d 1 $JAVA_HOME; echo check temp; du -h -d 1 /tmp; du -h -d 1 /; ls -lrt $JAVA_HOME
