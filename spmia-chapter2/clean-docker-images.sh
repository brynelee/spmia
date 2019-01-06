!/bin/bash

# clean up the docker processes
echo "cleaning up the running instances..."
docker rm common_eurekaserver_1
docker rm common_configserver_1
docker rm common_zipkin_1
docker rm common_zuulserver_1

echo "cleaning up the images ..."
docker rmi xdli/tmx-eurekasvr:springcloud
docker rmi xdli/tmx-confsvr:springcloud
docker rmi xdli/tmx-zipkinsvr:springcloud
docker rmi xdli/tmx-zuulsvr:springcloud



