#!/usr/bin/env bash

# Delete container & image
docker container rm -f about-me
docker image rm about-me:latest

# Build image
docker image build --tag=about-me:latest $PWD

# Run container
docker container run \
  --user     $(id -u) \
  --name     about-me \
  --network  lab-net \
  --publish  10007:8888 \
  --volume   $PWD/nginx.conf:/etc/nginx/nginx.conf \
  --volume   $PWD/logs:/app/logs \
  --restart  unless-stopped \
  --interactive \
  --detach \
  about-me:latest

# View log
docker container logs about-me
