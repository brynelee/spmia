#!/bin/bash

# used to clean the local registry item
# usage: rmreg.sh <image name> <image tag>

echo "usage: rmreg.sh <image name> <image tag>"

SHA_STRING=$(curl -v --silent -H "Accept: application/vnd.docker.distribution.manifest.v2+json" -X GET http://xdubuntu1804:5000/v2/$1/manifests/$2 2>&1 | grep Docker-Content-Digest | awk '{print ($3)}')

echo $SHA_STRING

imageurl=xdubuntu1804:5000/v2/$1/manifests/$SHA_STRING

echo $imageurl

imageurl=${imageurl%$'\r'}

curl -I -X DELETE $imageurl

#do garbage collection, really purge the repository images
docker exec xdregistry /bin/registry garbage-collect /etc/docker/registry/config.yml







