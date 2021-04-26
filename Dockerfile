FROM alpine:latest
RUN apk update
RUN apk add openjdk11-jdk curl unzip bash
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin
RUN cd /usr/local && \
    curl -O https://lift.cs.princeton.edu/java/linux/lift-cli.zip && \
    unzip lift-cli.zip && \
    rm lift-cli.zip
RUN sed 's#/bin/ash#/bin/bash#' -i /etc/passwd
RUN mkdir /code
WORKDIR /code
