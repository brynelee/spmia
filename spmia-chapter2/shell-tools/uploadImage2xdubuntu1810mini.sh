#!/bin/bash

echo "usage: $1 is image name (without xdli/), $2 is image tag, if not set, springcloud will be used as default"

DEST_REGSERVER=xdubuntu1810mini:5000

if [ -n "$2" ] # -n 检查$2是否为空
then
    imageTag=$2
else
    imageTag=springcloud
fi

docker tag xdli/$1:$imageTag $DEST_REGSERVER/$1:$imageTag
docker push $DEST_REGSERVER/$1:$imageTag
docker rmi $DEST_REGSERVER/$1:$imageTag

