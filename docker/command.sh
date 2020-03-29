#!/bin/sh

if [ -f "tmp/pids/server.pid" ]; then
  rm -f tmp/pids/server.pid
fi

if [ -f "Gemfile" ]; then
  bundle config git.allow_insecure true
  bundle check || bundle install
  # bundle exec skylight disable_dev_warning
  bundle exec rake log:clear
  bundle exec rake tmp:clear
  bundle exec rake db:migrate
  bundle exec rake about
fi

socat TCP-LISTEN:80,fork,reuseaddr TCP:localhost:3000 & bundle exec rails s & bundle exec sidekiq
