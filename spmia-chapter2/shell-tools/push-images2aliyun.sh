#!/bin/bash

docker login --username=qqlc666@sina.com registry.cn-beijing.aliyuncs.com

KUBE_VERSION=v1.13.1
KUBE_PAUSE_VERSION=3.1
ETCD_VERSION=3.2.24
DNS_VERSION=1.2.6

images=(
kube-apiserver:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-proxy:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${DNS_VERSION}
)

K8S_GCR_URL=k8s.gcr.io
ALIYUN_URL=registry.cn-beijing.aliyuncs.com/brynelee

for imageName in ${images[@]} ; do
#docker pull ${K8S_GCR_URL}/$imageName
docker tag ${K8S_GCR_URL}/$imageName $ALIYUN_URL/$imageName
docker push $ALIYUN_URL/$imageName
docker rmi $ALIYUN_URL/$imageName
done
