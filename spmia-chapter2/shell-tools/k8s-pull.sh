#!/bin/bash
 
ARCH=amd64
version=v1.13.1
username=<username>
 
#https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/#config-file
images=(kube-apiserver-${ARCH}:${version} \
	kube-controller-manager-${ARCH}:${version} \
	kube-scheduler-${ARCH}:${version} \
	kube-proxy-${ARCH}:${version} \
	etcd-${ARCH}:3.2.24 \
	pause-${ARCH}:3.1 \
	coredns-${ARCH}:1.2.6 \
	)
 
for image in ${images[@]}
do
	docker pull ${username}/${image}
	#docker tag ${username}/${image} k8s.gcr.io/${image}
	docker tag ${username}/${image} gcr.io/google_containers/${image}
	docker rmi ${username}/${image}
done
 
unset ARCH version images username