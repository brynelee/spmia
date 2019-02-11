#! /bin/bash

echo "undeploy all the spmia cluster apps and middlewares"

nLong=10
nshort=5
nvshort=2

function waitAndCheckLong(){

    for i in {1..5}
    do
        kubectl get pods -o wide
        sleep 2
    done
}

function waitAndCheckShort(){

    for i in {1..3}
    do
        kubectl get pods -o wide
        sleep 1
    done
}

kubectl delete -f zuul-config/zuulservice.yml

waitAndCheckLong

kubectl delete -f licensing-config/licensingserver.yml
waitAndCheckLong
kubectl delete -f organization-config/organizationserver.yml
waitAndCheckShort
kubectl delete -f zipkin-config/zipkinsvr.yml
waitAndCheckLong
kubectl delete -f configserver-config/spmia-configserver.yml
kubectl delete -f configserver-config/spmia-configserver-service.yml
waitAndCheckShort
kubectl delete -f eureka-config/spmia-eurekaserver-pc.yml
kubectl delete -f eureka-config/spmia-eurekaserver-service.yml
waitAndCheckLong
kubectl delete -f xdpostgres-config/xdpostgres-db.yml
kubectl delete -f xdpostgres-config/xdpostgres-svc.yml
waitAndCheckLong
kubectl delete -f xdpostgres-config/mypvc1.yml
waitAndCheckShort
kubectl delete -f xdpostgres-config/nfs-pv1.yml
waitAndCheckShort
kubectl delete -f kafka-config/kafka.yml
waitAndCheckShort
kubectl delete -f kafka-config/kafka-service.yml
waitAndCheckShort
kubectl delete -f kafka-config/zookeeper.yml
waitAndCheckLong
kubectl delete -f redis-config/redis.yml

waitAndCheckShort
kubectl delete -f tools/xdubuntuxdli.yml

waitAndCheckLong
