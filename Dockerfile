FROM openjdk:17-jdk-slim

VOLUME /tmp
ARG JAR_FILE=target/microservices-tracing-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
ADD dist/opentelemetry-javaagent.jar opentelemetry-javaagent.jar

ENTRYPOINT exec java -javaagent:opentelemetry-javaagent.jar $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar