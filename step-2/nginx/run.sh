#!/usr/bin/env bash

set -x

docker run --rm --name my-nginx -p 8080:80 my-nginx:1.0