FROM ubuntu:16.04
MAINTAINER Jeremy Yang "zheng.yang.au@gmail.com"

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y --no-install-recommends oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME="/usr/lib/jvm/java-8-oracle"
ENV PATH=$JAVA_HOME/bin;$PATH
RUN java -version
COPY my-hello-world-0.0.1-SNAPSHOT.jar /opt/my-hello-world-0.0.1-SNAPSHOT.jar
ENTRYPOINT java -jar /opt/my-hello-world-0.0.1-SNAPSHOT.jar