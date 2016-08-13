#!/bin/bash
docker-machine start default
eval "$(docker-machine env default)"
eval 'docker-machine env 2>/dev/null'
docker-compose up
