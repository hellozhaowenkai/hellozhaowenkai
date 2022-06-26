#!/usr/bin/env bash

docker container rm -f about-me

docker image rm about-me:latest

docker image build --tag=about-me:latest .

docker container run \
  --user     $(id -u) \
  --name     about-me \
  --publish  10007:8888 \
  --volume   $PWD/nginx.conf:/etc/nginx/nginx.conf \
  --volume   $PWD/logs:/app/logs \
  --restart  unless-stopped \
  --interactive \
  --detach \
  about-me:latest

docker container logs about-me
