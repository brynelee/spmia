#!/bin/bash

KUBE_VERSION=v1.13.1
KUBE_PAUSE_VERSION=3.1
ETCD_VERSION=3.2.24
DNS_VERSION=1.14.4



images=(
kube-apiserver:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-proxy:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${DNS_VERSION}
)

for imageName in ${images[@]} ; do
docker pull mirrorgooglecontainers/$imageName
docker tag mirrorgooglecontainers/$imageName k8s.gcr.io/$imageName
docker rmi mirrorgooglecontainers/$imageName
done

#docker pull anjia0532/google-containers.coredns:${DNS_VERSION}
#docker tag anjia0532/google-containers.coredns:${DNS_VERSION} k8s.gcr.io/coredns:${DNS_VERSION}
#docker rmi anjia0532/google-containers.coredns:${DNS_VERSION}


