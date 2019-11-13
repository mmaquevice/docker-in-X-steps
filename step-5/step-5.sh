#!/usr/bin/env bash

set -x


# No Networking
docker run --net=none --name busybox busybox ip a


# Host Networking
docker run --rm --net=host busybox ip addr
# ==> same as `$ ip addr`


# Bridge Networking (default)
docker run -it --rm busybox --name busybox /bin/sh
# inside container: > $ ip addr
#                   > $ ip route show
# in host: > $ ip addr | grep -A 50 veth
#          > docker inspect busybox --format='{{json .NetworkSettings.IPAddress}}'

# With Publishing
docker run -p 8080:80 --name web -d nginx
docker inspect web --format='{{json .NetworkSettings.IPAddress}}'
sudo iptables -L -t nat -v
sudo iptables -L -t filter -v
# ==> table NAT & FILTER have been altered

# Custom Bridge Networking
docker network create mynetwork
docker run -it --rm --name=container-a --network=mynetwork busybox /bin/sh
docker run -it --rm --name=container-b --network=mynetwork busybox /bin/sh

# Container-Defined Network
docker run -it --rm --name=container-a busybox /bin/sh
docker run -it --rm --name=container-b --network=container:container-a busybox /bin/sh
# try on both containers: > $ nc -lvp 8080


# Overlay Networking
docker swarm init
docker network create -d overlay --attachable step-5
docker run --rm --name container-1 -it --net step-5 busybox /bin/sh
docker run --rm --name container-2 -it --net step-5 busybox /bin/sh
docker service create --name app --replicas 2 --network step-5 -p 8000:80 nginx
# connect to localhost:8000

# Clean up
docker service rm app
docker network rm step-5
docker swarm leave --force
