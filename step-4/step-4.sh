#!/usr/bin/env bash

set -x

# image build
bash front/build.sh

# swarm cluster initialization
docker swarm init

# deployment v1
docker stack deploy -c docker-compose-v1.yml step-4

# commands to investigate
docker ps
docker service ls
docker service ps step-4_web
curl http://[YOUR IP]/

# deployment v2
docker stack deploy -c docker-compose-v2.yml step-4
# deployment v3
docker stack deploy -c docker-compose-v3.yml step-4

# clean up
docker stack rm step-4
docker swarm leave --force
