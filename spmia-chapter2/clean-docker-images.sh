#!/usr/bin/env bash

# clean up the docker processes
echo "cleaning up the running instances..."
docker rm common_eurekaserver_1
docker rm common_configserver_1
docker rm common_zipkin_1
docker rm common_zuulserver_1
docker rm common_logspout_1
docker rm common_organizationservice_1
docker rm common_licensingservice_1
docker rm common_redis_1
docker rm common_database_1
docker rm common_kafkaserver_1

echo "cleaning up the images ..."
docker rmi xdli/tmx-eurekasvr:springcloud
docker rmi xdli/tmx-confsvr:springcloud
docker rmi xdli/tmx-zipkinsvr:springcloud
docker rmi xdli/tmx-zuulsvr:springcloud
docker rmi xdli/tmx-licensing-service:springcloud
docker rmi xdli/tmx-organization-service:springcloud
