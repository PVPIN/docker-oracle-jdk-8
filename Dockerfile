FROM pvpin/ubuntu:latest
MAINTAINER wolfg1969 <wolfg1969@qq.com>

ENV REFRESHED_AT 20170103

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

# set default java environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/

RUN apt-get install -y software-properties-common && \
add-apt-repository ppa:webupd8team/java -y && \
echo debconf shared/accepted-oracle-license-v1-1 select true |  debconf-set-selections && \
echo debconf shared/accepted-oracle-license-v1-1 seen true |  debconf-set-selections
RUN apt-get update
RUN apt-get install -y --no-install-recommends oracle-java8-installer
RUN apt-get install -y --no-install-recommends oracle-java8-set-default
RUN rm -rf /var/cache/oracle-jdk8-installer && rm -rf /var/lib/apt/lists/*
