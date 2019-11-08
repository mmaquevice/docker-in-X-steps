#!/usr/bin/env bash

# images
docker pull nginx:1.17.5
docker images
docker rmi nginx:1.17.5

# containers
docker run nginx:1.17.5
docker ps
## with port forwarding
docker run --rm --name nginx -d -p 8080:80 nginx:1.17.5
## with volume
docker run --rm --name nginx -d -p 8080:80 -v $(pwd):/usr/share/nginx/html:ro nginx:1.17.5

## stop, start, ...
docker stop nginx
docker start nginx
docker rm nginx
