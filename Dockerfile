FROM frolvlad/alpine-glibc

LABEL maintainer="dimitrij.drus@innoq.com"

ENV GIT_CRYPT_VERSION 0.6.0

RUN apk update && \
    apk add --no-cache bash curl git sqlite openssh-client openssl libgcc libstdc++ openssl-dev g++ make && \
    curl -L https://github.com/AGWA/git-crypt/archive/$GIT_CRYPT_VERSION.tar.gz | tar zxv -C /var/tmp && \
    cd /var/tmp/git-crypt-$GIT_CRYPT_VERSION && \
    make && \
    make install PREFIX=/usr/local && \
    apk del openssl-dev g++ make && \
    rm -rf /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
