FROM ruby:2.6-alpine

MAINTAINER Mbanq <dev@mbanq.com>

RUN apk update -q && apk upgrade -q; \
    apk add --update-cache -q cargo nodejs npm git jq py-pip bash; \
    gem install cfn-nag --silent; \
    cargo install cfn-guard; \
    pip install cfn-lint; \
    rm -rf /var/cache/apk/* /root/.cargo/registry/*

ENV PATH "/root/.cargo/bin:${PATH}"