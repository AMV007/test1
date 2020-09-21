FROM openjdk
MAINTAINER Akrisitiniy Maksim
COPY build/libs/oslms-ms-datawriter-0.0.1.jar /deployments/app.jar
COPY libs/oslms-utils-1.0.1.jar /deployments/libs/oslms-utils-1.0.1.jar
ENV JAVA_OPTS="$JAVA_OPTS -Xms500m -Xmx1024m"
ENV postgresql=${postgresql}
ENV dbname=${dbname}
ENV dbuser=${dbuser}
ENV dbpassword=${dbpassword}
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /deployments/app.jar -databaseAddress $s_postgresql -databaseName $s_dbname -databaseUser $s_dbuser -databasePassword $s_dbpassword" ]