#!/usr/bin/env bash

set -x


docker run --rm -d ubuntu:latest sleep infinity

# What is the user?
ps aux | grep sleep

# Try with:
docker run --rm --user $UID -d ubuntu:latest sleep infinity
docker run --rm --user 1234 -d ubuntu:latest sleep infinity


