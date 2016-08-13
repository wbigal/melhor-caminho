#!/bin/bash
docker-machine start default
eval "$(docker-machine env default)"
eval 'docker-machine env 2>/dev/null'
docker build .
docker-compose build
docker-compose up
