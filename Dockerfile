FROM ruby:2.6-alpine

RUN apk --update add --no-cache \
  build-base \
  tzdata \
  postgresql-client \
  postgresql-dev \
  socat \
  nano \
  && rm -rf /var/cache/apk/*

RUN echo "gem: --no-document" > /root/.gemrc

WORKDIR /opt/project/app