#!/bin/bash

docker login --username=qqlc666@sina.com registry.cn-beijing.aliyuncs.com

if [ -n "$2" ] # -n 检查$2是否为空
then
    domain=$1
    imageName=$2
else
    domain=k8s.gcr.io
    imageName=$1
fi


ALIYUN_URL=registry.cn-beijing.aliyuncs.com/brynelee

docker pull $ALIYUN_URL/$imageName
docker tag $ALIYUN_URL/$imageName ${domain}/$imageName
docker rmi $ALIYUN_URL/$imageName

