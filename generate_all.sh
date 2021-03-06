ALPINE_VERSIONS=(3.10 3.11)
UBUNTU_VERSIONS=(20.04)
JDK_VERSIONS=(8.181.13.96a7b8442fe848ef90c96a2fad6ed6d1 10.0.2.19aef61b38124481863b1413dce1855f)
OPEN_JDK_VERSIONS=(jdk-14.0.1 jdk-15)

#
#echo "${ALPINE_VERSIONS[@]}"
#for ALPINE_VERSION in "${ALPINE_VERSIONS[@]}"
#   do
#   for JDK_VERSION in "${JDK_VERSIONS[@]}"
#      do
#         OIFS=$IFS
#         IFS='.' read -ra JDK_VERSION_ARRAY <<< "$JDK_VERSION"
#         IFS=$OIFS
#
#         DIR=oracle/jdk_${JDK_VERSION_ARRAY[0]}_${JDK_VERSION_ARRAY[1]}_${JDK_VERSION_ARRAY[2]}/alpine_$ALPINE_VERSION
#         echo "$DIR"
#         mkdir -p $DIR
#         ./Alpine_Dockerfile.sh $ALPINE_VERSION $JDK_VERSION  > $DIR/Dockerfile
#      done
#   done

for ALPINE_VERSION in "${ALPINE_VERSIONS[@]}"
   do
   for JDK_VERSION in "${OPEN_JDK_VERSIONS[@]}"
      do
         OIFS=$IFS
         IFS='.' read -ra JDK_VERSION_ARRAY <<< "$JDK_VERSION"
         IFS=$OIFS

         DIR=openjdk/${JDK_VERSION}/alpine_$ALPINE_VERSION
         echo "$DIR"
         mkdir -p $DIR
         ./Alpine_OpenJdk_Dockerfile.sh $ALPINE_VERSION $JDK_VERSION  > $DIR/Dockerfile
      done
   done

for UBUNTU_VERSION in "${UBUNTU_VERSIONS[@]}"
   do
   for JDK_VERSION in "${OPEN_JDK_VERSIONS[@]}"
      do
#         OIFS=$IFS
#         IFS='.' read -ra JDK_VERSION_ARRAY <<< "$JDK_VERSION"
#         IFS=$OIFS

         DIR=openjdk/${JDK_VERSION}/ubuntu_$UBUNTU_VERSION
         echo "$DIR"
         mkdir -p $DIR
         ./Ubuntu_OpenJdk_Dockerfile.sh $UBUNTU_VERSION $JDK_VERSION  > $DIR/Dockerfile
      done
   done


