#!/usr/bin/env bash

# for grafana local proxy

kubectl -n istio-system port-forward \
$(kubectl -n istio-system get pod -l app=grafana -o \
jsonpath='{.items[0].metadata.name}') 3000:3000 &

echo "wait..."
sleep 2

# for prometheus local proxy

kubectl -n istio-system port-forward \
$(kubectl -n istio-system get pod -l app=prometheus -o \
jsonpath='{.items[0].metadata.name}') 9090:9090 &

echo "wait..."
sleep 2

# for Jaeger local proxy

kubectl -n istio-system port-forward \
$(kubectl -n istio-system get pod -l app=jaeger -o \
jsonpath='{.items[0].metadata.name}') 16686:16686 &

echo "wait..."
sleep 2

# for starting local nginx proxy for sharing services above listed

docker run --name xdnginx --net=host \
-v /home/xiaodong/istio/istioStudy/nginxStudy/nginx.conf:/etc/nginx/nginx.conf:ro \
-d nginx

echo "done..."

