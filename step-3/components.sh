#!/usr/bin/env bash

# Run ephemeral containers
docker run --rm --name alpine1 -d alpine sleep 60
docker run --rm --name alpine2 -d alpine sleep 60

# Connect to one of them
docker exec -it alpine1 /bin/sh

# Find child process of containerd
ps fxa | grep containerd -A 3

# What happens if you kill the sleep process?
sudo kill -9 [PID sleep 60]

# What happens if you kill the containerd-shim process?
sudo kill -9 [PID containerd] && kill [PID docker exec]