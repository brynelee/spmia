#!/bin/bash

PROXY_HOST=127.0.0.1
export all_proxy=http://$PROXY_HOST:8118
export ftp_proxy=http://$PROXY_HOST:8118
export http_proxy=http://$PROXY_HOST:8118
export https_proxy=http://$PROXY_HOST:8118
export no_proxy=localhost,172.16.0.0/16,192.168.0.0/16,192.168.245.0/8,127.0.0.1,10.10.0.0/16,10.96.0.0/12,10.244.0.0/12
