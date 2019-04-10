FROM alpine:3.8

LABEL maintainer="dimitrij.drus@innoq.com"

ENV VERSION 0.6.0

RUN apk update && \
    apk add --no-cache curl git sqlite openssh openssl libgcc libstdc++ openssl-dev g++ make && \
    curl -L https://github.com/AGWA/git-crypt/archive/$VERSION.tar.gz | tar zxv -C /var/tmp && \
    cd /var/tmp/git-crypt-$VERSION && \
    make && \
    make install PREFIX=/usr/local && \
    apk del openssl-dev g++ make && \
    rm -rf /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
