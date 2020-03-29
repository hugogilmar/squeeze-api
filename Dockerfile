FROM ruby:2.6-alpine

RUN apk --update add --no-cache \
  bash \
  build-base \
  nano \
  postgresql-client \
  postgresql-dev \
  socat \
  tzdata \
  && rm -rf /var/cache/apk/*

ENV APP_HOME /opt/project/app
ENV DOCKER_HOME /opt/project/docker

RUN mkdir -p $DOCKER_HOME
ADD docker/command.sh $DOCKER_HOME
ADD docker/entrypoint.sh $DOCKER_HOME

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME
ADD Gemfile.lock $APP_HOME
RUN echo "gem: --no-document" > /root/.gemrc
RUN bundle install

VOLUME /usr/local/bundle

ADD . $APP_HOME

ENTRYPOINT /opt/project/docker/entrypoint.sh
CMD /opt/project/docker/command.sh
