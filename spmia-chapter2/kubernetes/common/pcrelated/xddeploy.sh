#!/bin/sh

NODE_NAME=redis-service
REDIS_EXTERNAL_PORT="30379"
ZK_EXTERNAL_PORT="30181"
KAFKA_EXTERNAL_PORT="30092"



echo "********************************************************"
echo "deploy redis-service first"
echo "********************************************************"
kubectl apply -f redis-config/redis.yml
while ! `nc -z $NODE_NAME $REDIS_EXTERNAL_PORT`; do sleep 3; done
echo "******* redis Server has started"


echo "********************************************************"
echo "deploy KAFKA service ..."
echo "********************************************************"
kubectl apply -f kafka-config/zookeeper.yml
while ! `nc -z $NODE_NAME $ZK_EXTERNAL_PORT`; do sleep 3; done
echo "******* zk Server has started"
kubectl apply -f kafka-config/kafka-service.yml
kubectl apply -f kafka-config/kafka.yml
while ! `nc -z $NODE_NAME $KAFKA_EXTERNAL_PORT`; do sleep 3; done
echo "******* kafka Server has started"












echo "********************************************************"
echo "Waiting for the eureka server to start on port $EUREKASERVER_PORT"
echo "********************************************************"
while ! `nc -z eurekaserver $EUREKASERVER_PORT`; do sleep 3; done
echo "******* Eureka Server has started"

echo "********************************************************"
echo "Waiting for the database server to start on port $DATABASESERVER_PORT"
echo "********************************************************"
while ! `nc -z xdpostgres $DATABASESERVER_PORT`; do sleep 3; done
echo "******** Database Server has started "

echo "********************************************************"
echo "Waiting for the configuration server to start on port $CONFIGSERVER_PORT"
echo "********************************************************"
while ! `nc -z configserver $CONFIGSERVER_PORT`; do sleep 3; done
echo "*******  Configuration Server has started"

echo "********************************************************"
echo "Waiting for the kafka server to start on port $KAFKASERVER_PORT"
echo "********************************************************"
while ! `nc -z kafka-service $KAFKASERVER_PORT`; do sleep 10; done
echo "******* Kafka Server has started"

echo "********************************************************"
echo "Waiting for the ZIPKIN server to start  on port $ZIPKIN_PORT"
echo "********************************************************"
while ! `nc -z zipkin-service $ZIPKIN_PORT`; do sleep 10; done
echo "******* ZIPKIN has started"

