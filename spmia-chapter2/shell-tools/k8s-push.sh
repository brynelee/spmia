#!/bin/bash
 
ARCH=amd64
version=v1.13.1
username=bryne
 
#https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/#config-file
images=(kube-apiserver-${ARCH}:${version} \
	kube-controller-manager-${ARCH}:${version} \
	kube-scheduler-${ARCH}:${version} \
	kube-proxy-${ARCH}:${version} \
	etcd-${ARCH}:3.2.24 \
	pause-${ARCH}:3.1 \
	coredns-${ARCH}:1.2.6
	)
 
docker login -u $username -p Little
 
for image in ${images[@]}
do
	docker pull k8s.gcr.io/${image}
	docker tag k8s.gcr.io/${image} ${username}/${image}
	docker push ${username}/${image}
	docker rmi k8s.gcr.io/${image}
	docker rmi ${username}/${image}
done
 
unset ARCH version images username