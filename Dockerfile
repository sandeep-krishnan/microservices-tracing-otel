FROM openjdk:17-jdk

VOLUME /tmp
ARG JAR_FILE=target/microservices-tracing-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar

RUN curl -L -o opentelemetry-javaagent.jar https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar

ENTRYPOINT exec java -javaagent:opentelemetry-javaagent.jar $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar