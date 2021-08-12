FROM ruby:2.6-alpine

MAINTAINER Mbanq <dev@mbanq.com>

COPY scripts/*    /usr/bin/

RUN apk update -q && apk upgrade -q; \
    apk add --update-cache -q cargo nodejs npm git jq py-pip bash openjdk11 unzip curl; \
    gem install cfn-nag --silent; \
    cargo install cfn-guard --version 1.0.0; \
    pip install cfn-lint; \
    rm -rf /var/cache/apk/* /root/.cargo/registry/*; \
    curl -s https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.5.0.2216.zip \
    -o sonar-scanner-cli-4.5.0.2216.zip; \
    unzip sonar-scanner-cli-4.5.0.2216.zip -d /opt/; \
    ln -s /opt/sonar-scanner-4.5.0.2216/bin/sonar-scanner /usr/local/bin/sonar-scanner; \
    chmod +x /usr/bin/cfn-*; \
    chmod +x /usr/bin/metric.sh; \
    sed -e $'s/\xC2\xA0/ /g' -e $'s/\xE2\x80\x8b//g' -i /usr/bin/metric.sh

ENV PATH "/root/.cargo/bin:${PATH}"
