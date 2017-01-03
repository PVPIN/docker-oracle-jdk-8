FROM pvpin/ubuntu:latest
MAINTAINER wolfg1969 <wolfg1969@qq.com>

ENV REFRESHED_AT 20170103

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

# set default java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/

RUN apt-get install -y software-properties-common && \
add-apt-repository ppa:webupd8team/java --keyserver keyserver.ubuntu.com:80 -y && \
echo debconf shared/accepted-oracle-license-v1-1 select true |  debconf-set-selections && \
echo debconf shared/accepted-oracle-license-v1-1 seen true |  debconf-set-selections && \
apt-get update && \
apt-get install -y --no-install-recommends oracle-java8-installer && \
apt-get install -y --no-install-recommends oracle-java8-set-default && \
rm -rf /var/cache/oracle-jdk8-installer && \
rm -rf /var/lib/apt/lists/*
