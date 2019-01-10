#!/bin/sh
echo "********************************************************"
echo "Waiting for the eureka server to start on port $EUREKASERVER_PORT"
echo "********************************************************"
while ! `nc -z eurekaserver $EUREKASERVER_PORT`; do sleep 3; done
echo "******* Eureka Server has started"

echo "********************************************************"
echo "Starting Configuration Service with Eureka Endpoint:  $EUREKASERVER_URI";
echo "********************************************************"
java -Djava.security.egd=file:/dev/./urandom \
     -Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI \
     -Dspring.cloud.config.server.git.uri=$GITSERVER_URI \
     -Dspring.cloud.config.server.git.searchPaths=$SEARCHPATHS \
     -Dspring.cloud.config.server.git.username=$USERNAME \
     -Dspring.cloud.config.server.git.password=$PASSWORD \
     -jar /usr/local/configserver/@project.build.finalName@.jar
