#!/usr/bin/env bash

kubectl apply -f /home/xiaodong/real/istioStudy/flaskapp.istio.yml
kubectl apply -f /home/xiaodong/real/istioStudy/sleep-istio.yml
kubectl apply -f /home/xiaodong/real/istioStudy/testTools/httpbin/httpbin.yaml
kubectl get po -w

