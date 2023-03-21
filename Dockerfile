FROM openjdk:17-jdk

VOLUME /tmp
ARG JAR_FILE=target/microservices-tracing-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar

ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar