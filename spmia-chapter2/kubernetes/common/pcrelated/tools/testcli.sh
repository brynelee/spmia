#! /bin/bash

POD_NAME=$(kubectl get pods | awk '/xdubuntu/{print $1}')
echo $POD_NAME

kubectl exec -it $POD_NAME -- /bin/bash
