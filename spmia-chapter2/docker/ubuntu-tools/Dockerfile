# 设置基本的镜像，后续命令都以这个镜像为基础 

FROM ubuntu:latest

# 作者信息 

MAINTAINER  xiaodong

# RUN命令会在上面指定的镜像里执行任何命令 

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak

COPY sources.list /etc/apt/

RUN apt-get update

RUN apt-get install -y iputils-ping

RUN apt-get install -y nginx

RUN apt-get install -y curl

RUN apt-get install -y net-tools

RUN apt-get install -y lrzsz

#暴露ssh端口

EXPOSE  80 

CMD /bin/bash
