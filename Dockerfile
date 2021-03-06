FROM openjdk:8u151-jre-alpine
ENV HZ_VERSION 3.9.1
ENV HZ_HOME /opt/hazelcast/
RUN mkdir -p $HZ_HOME
WORKDIR $HZ_HOME
# Download hazelcast jars from maven repo.
ADD https://repo1.maven.org/maven2/com/hazelcast/hazelcast-all/$HZ_VERSION/hazelcast-all-$HZ_VERSION.jar $HZ_HOME
ADD server.sh /$HZ_HOME/server.sh
ADD stop.sh /$HZ_HOME/stop.sh
RUN chmod +x /$HZ_HOME/server.sh
RUN chmod +x /$HZ_HOME/stop.sh
RUN apk add --update
RUN apk add --update bash
# Start hazelcast standalone server.
CMD ["./server.sh"]
EXPOSE 5701
