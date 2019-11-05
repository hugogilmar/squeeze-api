#!/bin/sh

while ! nc -z db.dev 5432; do sleep 1; done;
while ! nc -z cache.dev 6379; do sleep 1; done;

exec "$@"