#!/bin/bash

KUBE_VERSION=v1.13.1
KUBE_PAUSE_VERSION=3.1
ETCD_VERSION=3.2.24
DNS_VERSION=1.2.6
FLANNEL_VERSION=v0.8.0-amd64

K8S_GCR_URL=k8s.gcr.io
QUAY_URL=quay.io/coreos
ALIYUN_URL=registry.cn-beijing.aliyuncs.com/brynelee

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
docker pull ${ALIYUN_URL}/$imageName
docker tag ${ALIYUN_URL}/$imageName ${K8S_GCR_URL}/$imageName
docker rmi ${ALIYUN_URL}/$imageName
done

docker pull ${ALIYUN_URL}/flannel:${FLANNEL_VERSION}
docker tag ${ALIYUN_URL}/flannel:${FLANNEL_VERSION} ${QUAY_URL}/flannel:${FLANNEL_VERSION}
docker rmi ${ALIYUN_URL}/flannel:${FLANNEL_VERSION}


