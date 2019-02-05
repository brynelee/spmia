#!/bin/bash
images=(
kube-apiserver-amd64:v1.13.1
kube-controller-manager-amd64:v1.13.1
kube-scheduler-amd64:v1.13.1
kube-proxy-amd64:v1.13.1
pause-amd64:3.1
etcd-amd64:3.2.24
)

for imageName in ${images[@]} ; do
docker pull mirrorgooglecontainers/$imageName
docker tag mirrorgooglecontainers/$imageName k8s.gcr.io/$imageName
docker rmi mirrorgooglecontainers/$imageName
done

docker pull anjia0532/google-containers.coredns:1.2.6
docker tag anjia0532/google-containers.coredns:1.2.6 k8s.gcr.io/coredns:1.2.6
docker rmi anjia0532/google-containers.coredns:1.2.6


